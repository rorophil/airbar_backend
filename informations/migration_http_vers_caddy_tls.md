# Migration d'une Production Existante (HTTP:8080) vers Caddy + TLS + Pinning

**Audience :** Administrateurs ayant déjà un serveur AirBar en production, actuellement accessible en HTTP direct sur le port 8080 (sans reverse proxy), qu'ils administrent via SSH.

**Objectif :** Basculer ce serveur existant vers l'architecture Caddy (TLS avec CA locale `tls internal`, certificate pinning côté app) **sans perte de données**, avec une fenêtre de coupure minimale et un plan de retour en arrière à chaque étape.

**Version:** 1.0
**Date:** 2026-10-12

---

## 📋 Table des matières

1. [Avant de commencer](#avant-de-commencer)
2. [Vue d'ensemble de la bascule](#vue-densemble-de-la-bascule)
3. [Étape 1 — Sauvegardes](#étape-1--sauvegardes)
4. [Étape 2 — Mettre à jour le code sur le serveur](#étape-2--mettre-à-jour-le-code-sur-le-serveur)
5. [Étape 3 — Configurer `.env` et `config/production.yaml`](#étape-3--configurer-env-et-configproductionyaml)
6. [Étape 4 — Déployer Caddy en parallèle du port 8080 existant](#étape-4--déployer-caddy-en-parallèle-du-port-8080-existant)
7. [Étape 5 — Extraire, sauvegarder et épingler la CA](#étape-5--extraire-sauvegarder-et-épingler-la-ca)
8. [Étape 6 — Valider avec l'app avant de couper le HTTP](#étape-6--valider-avec-lapp-avant-de-couper-le-http)
9. [Étape 7 — Couper le port 8080 (bascule définitive)](#étape-7--couper-le-port-8080-bascule-définitive)
10. [Plan de retour en arrière (rollback)](#plan-de-retour-en-arrière-rollback)
11. [Checklist récapitulative](#checklist-récapitulative)

---

## ⚠️ Avant de commencer

**Ce guide suppose que votre serveur actuel ressemble à ceci** (ancienne configuration, sans Caddy) :

```yaml
# docker-compose.yaml (ANCIEN, avant migration)
airbar_server:
  container_name: airbar_backend_prod
  ports:
    - "8080:8080"
    - "8081:8081"
    - "8082:8082"
  environment:
    - runmode=production
    - serverid=prod-001
    # ...
```

```yaml
# config/production.yaml (ANCIEN)
apiServer:
  port: 8080
  publicHost: <votre-ip-publique>
  publicPort: 8080
  publicScheme: http
```

Et que les clients Flutter se connectent aujourd'hui en `http://<ip>:8080`, sans pinning.

**Point essentiel à comprendre avant de se lancer :** le certificate pinning exige que le certificat racine (CA) soit **embarqué dans l'application Flutter au moment de sa compilation**. Cette CA n'existe pas encore : elle sera générée par Caddy au premier démarrage, *sur ce serveur*. Il est donc **impossible de préparer l'app à l'avance** — l'ordre des opérations ci-dessous (déployer → extraire la CA → recompiler l'app → distribuer → couper le HTTP) doit être respecté strictement, sans quoi les utilisateurs se retrouveront bloqués hors connexion entre deux étapes.

**Fenêtre de maintenance recommandée :** aucune coupure de service n'est nécessaire avant l'étape 7. Caddy (port 443) est déployé **en plus** du port 8080 existant, qui continue de fonctionner normalement le temps que l'app mise à jour soit distribuée à tous les utilisateurs.

---

## 🗺️ Vue d'ensemble de la bascule

```
Avant :  App ──HTTP:8080──────────────────────────► Serveur
Pendant: App (ancienne) ──HTTP:8080─────────────────► Serveur ─┬─ (8080 direct, inchangé)
         App (nouvelle, test) ──HTTPS:443 (pinning)──► Serveur ─┘─ Caddy (nouveau)
Après :  App (toutes à jour) ──HTTPS:443 (pinning)───► Serveur ─── Caddy (8080 fermé au public)
```

---

## 💾 Étape 1 — Sauvegardes

**Toujours commencer par une sauvegarde complète**, avant toute modification.

```bash
ssh utilisateur@votre-serveur
cd ~/airbar_production/airbar_backend/airbar_backend_server   # adapter le chemin réel

# 1. Sauvegarder la base de données
docker exec airbar_postgres_prod pg_dump -U postgres -d airbar_backend -F c -f /tmp/backup_pre_migration.dump
docker cp airbar_postgres_prod:/tmp/backup_pre_migration.dump ./backup_pre_migration_$(date +%Y%m%d_%H%M%S).dump

# 2. Sauvegarder les fichiers de configuration actuels (avant écrasement)
mkdir -p ~/backup_pre_caddy
cp docker-compose.yaml ~/backup_pre_caddy/docker-compose.yaml.bak
cp .env ~/backup_pre_caddy/.env.bak
cp config/production.yaml ~/backup_pre_caddy/production.yaml.bak
```

✅ Conservez `~/backup_pre_caddy/` jusqu'à ce que la migration soit validée en production depuis plusieurs jours.

---

## 🔄 Étape 2 — Mettre à jour le code sur le serveur

```bash
# Toujours depuis le dossier du dépôt
cd ~/airbar_production/airbar_backend
git status   # vérifier qu'il n'y a pas de modifications locales non commitées en conflit
git fetch origin
git checkout securite   # la branche securite contient l'architecture Caddy/TLS/pinning tant qu'elle n'est pas mergée dans prod
git pull origin securite

cd airbar_backend_server
```

Le `git pull` doit ramener : le nouveau `docker-compose.yaml` (service `caddy` ajouté, `airbar_server` sans `ports:` publiés), le nouveau `Caddyfile`, et `config/production.yaml` mis à jour (`publicPort: 443`, `publicScheme: https`).

---

## ⚙️ Étape 3 — Configurer `.env` et `config/production.yaml`

### 3.1 Compléter `.env`

Le `.env` existant contient déjà vos mots de passe — **ne les touchez pas**. Ajoutez simplement les nouvelles variables en tête de fichier :

```bash
# Éditer le .env existant
nano .env
```

```bash
# À ajouter en haut du fichier .env (les mots de passe existants restent inchangés en dessous)
RUNMODE=production
SERVER_ID=prod-001
PUBLIC_ADDRESS=<votre-ip-publique-actuelle>
```

> `PUBLIC_ADDRESS` doit être l'adresse IP (ou nom d'hôte) que les clients utilisent déjà aujourd'hui pour joindre le serveur en `http://...:8080`.

### 3.2 Vérifier `config/production.yaml`

```bash
cat config/production.yaml
```

Confirmer que les trois serveurs (`apiServer`, `insightsServer`, `webServer`) ont bien :

```yaml
publicHost: <votre-ip-publique-actuelle>   # la même IP que PUBLIC_ADDRESS
publicPort: 443
publicScheme: https
```

Si `publicHost` contient encore `CHANGE_ME_PUBLIC_IP`, remplacez-le manuellement par votre IP réelle.

### 3.3 ⚠️ Republier temporairement le port 8080 (compatibilité ancienne app)

**Point critique :** dans le `docker-compose.yaml` ramené par `git pull`, le service `airbar_server` n'a **plus de `ports:`, uniquement `expose:`**. Or `expose:` ne publie jamais rien sur l'hôte — c'est strictement une déclaration interne au réseau Docker. Si vous appliquez ce fichier tel quel, **le port 8080 cesse d'être joignable depuis l'extérieur dès le premier `docker compose up`**, même si le pare-feu l'autorise encore côté OS. Les anciens clients (non mis à jour) perdraient donc immédiatement l'accès, bien avant d'avoir pu installer la nouvelle app avec pinning.

Pour conserver l'accès HTTP:8080 pendant toute la phase de transition, utilisez le fichier de surcouche fourni **`docker-compose.migration.yml`** (livré avec le `git pull`), qui republie temporairement le port 8080 sur `airbar_server` sans toucher au `docker-compose.yaml` principal :

```yaml
# docker-compose.migration.yml
services:
  airbar_server:
    ports:
      - "8080:8080"
```

> Le `docker-compose.yaml` principal reste inchangé (architecture finale, propre pour les nouvelles installations). Toutes les commandes `docker compose` des étapes 4 à 6 ci-dessous doivent inclure les deux fichiers via `-f docker-compose.yaml -f docker-compose.migration.yml`, le temps de la migration uniquement.

---

## 🚀 Étape 4 — Déployer Caddy en parallèle du port 8080 existant

```bash
docker compose -f docker-compose.yaml -f docker-compose.migration.yml config   # validation de la syntaxe avant de lancer quoi que ce soit
docker compose -f docker-compose.yaml -f docker-compose.migration.yml up -d --build
```

**Ce qui se passe :** `airbar_server` redémarre avec la publication temporaire du port 8080 (surcouche `docker-compose.migration.yml`), donc l'ancien accès HTTP continue de fonctionner. Le nouveau conteneur `caddy` démarre en parallèle et publie le port 443.

```bash
docker compose -f docker-compose.yaml -f docker-compose.migration.yml ps
```

**État attendu :**

```
NAME                      STATUS              PORTS
airbar_postgres_prod      Up (healthy)        0.0.0.0:5432->5432/tcp
airbar_redis_prod         Up (healthy)        0.0.0.0:6379->6379/tcp
airbar_backend_production Up                  0.0.0.0:8080->8080/tcp (temporaire, migration)
airbar_caddy_production   Up                  0.0.0.0:443->443/tcp
```

**Vérifier que l'ancien accès HTTP fonctionne toujours** (les clients existants ne doivent rien remarquer) :

```bash
curl http://localhost:8080/
```

**Vérifier que le nouveau Caddy fonctionne** :

```bash
curl -k https://localhost/
```

Si cette dernière commande échoue avec `tlsv1 alert internal error`, voir l'entrée de dépannage correspondante dans [installation_serveur_production.md](installation_serveur_production.md#dépannage) (ajout de `default_sni` dans le `Caddyfile`).

---

## 🔐 Étape 5 — Extraire, sauvegarder et épingler la CA

```bash
# Extraire le certificat et la clé privée générés par Caddy
docker compose -f docker-compose.yaml -f docker-compose.migration.yml cp caddy:/data/caddy/pki/authorities/local/root.crt ./root.crt
docker compose -f docker-compose.yaml -f docker-compose.migration.yml cp caddy:/data/caddy/pki/authorities/local/root.key ./root.key

# Vérifier leur présence avant de passer à la suite
ls -la root.crt root.key
```

> **⚠️ Ce sont de simples fichiers non versionnés sur le disque du serveur** : ils peuvent disparaître silencieusement (nettoyage manuel, script, erreur de manipulation) sans laisser de trace dans l'historique shell si la suppression a eu lieu via une commande SSH non-interactive (celles-ci n'écrivent jamais dans `.bash_history`/`.zsh_history`). Le CA source, lui, reste intact dans le volume Docker `caddy_data` tant qu'aucun `docker compose down -v` n'est exécuté — en cas de disparition, relancez simplement la commande d'extraction ci-dessus pour les régénérer à l'identique. Pensez à vérifier leur présence (`ls -la root.crt root.key`) après chaque déploiement (voir aussi [mise_a_jour_serveur.md](mise_a_jour_serveur.md#8-vérifier-que-tout-fonctionne)).

**Sauvegarder immédiatement hors du serveur**, sur une machine de confiance (remplacer `production` par `staging` selon l'environnement concerné) :

```bash
# Depuis votre poste local (pas le serveur)
scp utilisateur@votre-serveur:~/airbar_production/airbar_backend/airbar_backend_server/root.crt ~/AirBar-Secrets-Backup/production/root.crt
scp utilisateur@votre-serveur:~/airbar_production/airbar_backend/airbar_backend_server/root.key ~/AirBar-Secrets-Backup/production/root.key
chmod 600 ~/AirBar-Secrets-Backup/production/root.key
```

Une fois cette sauvegarde confirmée, vous pouvez supprimer les copies du serveur (`rm root.crt root.key`) : ce ne sont que des extractions dérivées, reproductibles à tout moment depuis le volume `caddy_data`.

**Épingler le certificat dans l'app Flutter** (sur votre poste de développement) :

```bash
cp ~/AirBar-Secrets-Backup/production/root.crt "<chemin-vers-le-repo-airbar>/assets/certs/production_root_ca.pem"
```

Puis recompiler l'application pour chaque plateforme distribuée (`flutter build apk`, `flutter build ios`, `flutter build windows`, etc.) et préparer sa distribution (store, MDM, installeur interne...) — **sans encore forcer la mise à jour de tous les utilisateurs**.

---

## ✅ Étape 6 — Valider avec l'app avant de couper le HTTP

Avant toute coupure, testez la nouvelle app sur au moins un appareil réel :

1. Installer la nouvelle version (avec la CA épinglée) sur un appareil de test.
2. Dans **Configuration serveur**, saisir l'IP habituelle et activer le **toggle HTTPS**.
3. Lancer « Tester la connexion » : doit réussir.
4. Effectuer un parcours complet (login, achat, vérification du solde) pour confirmer qu'aucune régression fonctionnelle n'est introduite par le changement de transport.
5. Vérifier qu'une app **non épinglée** (ancienne version) continue de fonctionner normalement en HTTP:8080 pendant toute cette phase.

**Ne passez à l'étape 7 que lorsque tous les utilisateurs ont reçu et installé la nouvelle version de l'app.** Tant que des utilisateurs sont sur l'ancienne version, le port 8080 doit rester ouvert.

---

## 🔒 Étape 7 — Couper le port 8080 (bascule définitive)

Une fois **tous** les clients migrés sur la nouvelle app HTTPS :

### 7.1 Retirer la publication Docker temporaire

Il suffit de ne plus référencer le fichier de surcouche : repasser à `docker compose` seul (sans `-f docker-compose.migration.yml`) recrée `airbar_server` conformément au `docker-compose.yaml` principal (qui n'a jamais eu de `ports:`, uniquement `expose:`).

```bash
docker compose up -d   # sans -f docker-compose.migration.yml : revient à la config finale (pas de --build nécessaire)
docker compose ps      # vérifier qu'airbar_backend_production n'a plus de port publié
```

Vous pouvez ensuite supprimer le fichier `docker-compose.migration.yml` du serveur (il ne sert plus) :

```bash
rm docker-compose.migration.yml
```

### 7.2 Fermer le pare-feu

```bash
# Linux (UFW)
sudo ufw delete allow 8080/tcp
sudo ufw delete allow 8081/tcp
sudo ufw delete allow 8082/tcp
sudo ufw allow 443/tcp
sudo ufw status
```

Vérifier qu'aucune règle de pare-feu, de groupe de sécurité cloud (AWS Security Group, GCP Firewall, Azure NSG...) ou de redirection de port sur la box/routeur ne laisse plus passer 8080/8081/8082 depuis l'extérieur.

**Test final :**

```bash
# Depuis un poste externe, hors du réseau du serveur
curl --max-time 5 http://<ip-serveur>:8080/   # doit timeout / être refusé
curl -k https://<ip-serveur>/                  # doit répondre 200
```

---

## ↩️ Plan de retour en arrière (rollback)

À n'importe quelle étape avant la coupure finale (étape 7), il est possible de revenir en arrière sans impact, puisque le port 8080 n'a jamais été fermé :

```bash
cd ~/airbar_production/airbar_backend/airbar_backend_server

# Arrêter Caddy uniquement (laisse airbar_server, postgres, redis intacts)
docker compose stop caddy

# Si besoin de revenir totalement à l'ancienne configuration :
cp ~/backup_pre_caddy/docker-compose.yaml.bak docker-compose.yaml
cp ~/backup_pre_caddy/.env.bak .env
cp ~/backup_pre_caddy/production.yaml.bak config/production.yaml
docker compose up -d
```

**Après l'étape 7** (port 8080 fermé), un rollback nécessite de rouvrir le pare-feu sur 8080/8081/8082 en plus des commandes ci-dessus — les clients devront revenir à l'ancienne version de l'app tant qu'elle est encore installée.

---

## ✅ Checklist récapitulative

- [ ] Sauvegarde de la base de données effectuée
- [ ] `docker-compose.yaml`, `.env`, `config/production.yaml` d'origine sauvegardés dans `~/backup_pre_caddy/`
- [ ] Code à jour (`git pull`) avec Caddyfile + nouveau docker-compose.yaml
- [ ] `.env` complété avec `RUNMODE`, `SERVER_ID`, `PUBLIC_ADDRESS`
- [ ] `config/production.yaml` vérifié (`publicPort: 443`, `publicScheme: https`)
- [ ] `docker-compose.migration.yml` utilisé pour republier temporairement le port 8080 sur `airbar_server` (étape 3.3, sinon l'ancienne app perd l'accès dès le déploiement)
- [ ] `docker compose -f docker-compose.yaml -f docker-compose.migration.yml up -d --build` exécuté, `... ps` conforme
- [ ] Ancien accès HTTP:8080 toujours fonctionnel (non cassé par le déploiement)
- [ ] Nouveau Caddy fonctionnel (`curl -k https://localhost/` → 200)
- [ ] CA extraite, présence vérifiée (`ls -la root.crt root.key`), sauvegardée hors serveur avec `chmod 600` sur `root.key`
- [ ] CA épinglée dans `assets/certs/production_root_ca.pem`, app recompilée
- [ ] App HTTPS testée avec succès sur au moins un appareil réel (connexion + parcours complet)
- [ ] Tous les utilisateurs ont installé la nouvelle version de l'app
- [ ] `docker-compose.migration.yml` retiré des commandes (étape 7.1), `docker compose up -d` réappliqué (seul `docker-compose.yaml`)
- [ ] Port 8080/8081/8082 fermé au pare-feu (test de non-accessibilité effectué depuis l'extérieur)
- [ ] `~/backup_pre_caddy/` conservé quelques jours avant suppression

---

## 📚 Voir aussi

- [installation_serveur_production.md](installation_serveur_production.md) — Guide complet pour une installation neuve (architecture Caddy/TLS détaillée, dépannage du `default_sni`)
- [mise_a_jour_serveur.md](mise_a_jour_serveur.md) — Procédure de mise à jour courante (hors migration d'architecture)
- `DEPLOYMENT.md` (dans `airbar_backend_server/`) — Référence technique sur le pinning côté Flutter

---

## 📝 Changelog

### Version 1.3 (2026-10-16)

- 🔎 Ajout d'une vérification de présence (`ls -la root.crt root.key`) juste après l'extraction (étape 5) et d'un avertissement : ce sont de simples fichiers non versionnés, supprimables silencieusement sans trace dans l'historique shell (les commandes SSH non-interactives n'écrivent pas dans `.bash_history`/`.zsh_history`) — le CA source reste cependant intact dans le volume `caddy_data` et reproductible à tout moment
- ✅ Recommandation de supprimer les copies serveur après confirmation de la sauvegarde hors serveur
- 🔁 Ajout d'un rappel de contrôle périodique dans [mise_a_jour_serveur.md](mise_a_jour_serveur.md) (étape 8) pour vérifier/re-sauvegarder la CA après chaque mise à jour

### Version 1.2 (2026-10-12)

- 🔧 Remplacement de l'édition manuelle temporaire de `docker-compose.yaml` par un fichier de surcouche dédié `docker-compose.migration.yml` (`docker compose -f docker-compose.yaml -f docker-compose.migration.yml ...`), pour ne jamais toucher au fichier canonique utilisé par les nouvelles installations

### Version 1.1 (2026-10-12)

- 🐛 Correction critique : `expose:` ne publie rien sur l'hôte — ajout de l'étape 3.3 (republication temporaire du port 8080 directement sur `airbar_server`) et de l'étape 7.1 (retrait de cette publication à la bascule finale), faute de quoi l'ancienne app perdait l'accès dès le premier déploiement du nouveau `docker-compose.yaml`

### Version 1.0 (2026-10-12)

- ✅ Création du guide de migration HTTP:8080 → Caddy + TLS + certificate pinning pour une production existante
