# AirBar Backend - Installation Rapide (Quickstart)
## Pour utilisateurs expérimentés

**⚡ Installation en 5 minutes** | Windows & Linux | Docker requis

---

## 🎯 Prérequis installés

- ✅ Git
- ✅ Docker + Docker Compose
- ✅ Accès administrateur / sudo

---

## 🚀 Installation (Windows)

```powershell
# 1. Cloner le projet (branche prod uniquement)
cd C:\
mkdir airbar_production; cd airbar_production
git clone -b prod --single-branch https://github.com/rorophil/airbar_backend.git
cd .\airbar_backend\airbar_backend_server

# 2. Configurer les secrets
copy .env.example .env
notepad .env
# ⚠️ Modifier POSTGRES_PASSWORD pour correspondre à config/passwords.yaml

# 3. Déployer
docker compose -f .\docker-compose.yaml up -d --build
docker compose -f .\docker-compose.yaml ps

# 4. Migrations (premier déploiement uniquement)
docker compose -f .\docker-compose.yaml run --rm --entrypoint /bin/sh airbar_server `
  -c "./server --mode=production --server-id=prod-001 --logging=normal --role=monolith --apply-migrations"

# 5. Redémarrer
docker compose -f .\docker-compose.yaml restart airbar_server

# 6. Tester
curl http://localhost:8080/
docker compose -f .\docker-compose.yaml logs -f airbar_server
```

---

## 🚀 Installation (Linux)

```bash
# 1. Cloner le projet (branche prod uniquement)
mkdir -p ~/airbar_production && cd ~/airbar_production
git clone -b prod --single-branch https://github.com/rorophil/airbar_backend.git
cd airbar_backend/airbar_backend_server

# 2. Configurer les secrets
cp .env.example .env
nano .env
# ⚠️ Modifier POSTGRES_PASSWORD pour correspondre à config/passwords.yaml

# 3. Sécuriser .env
chmod 600 .env

# 4. Déployer
docker compose -f ./docker-compose.yaml up -d --build
docker compose -f ./docker-compose.yaml ps

# 5. Migrations (premier déploiement uniquement)
docker compose -f ./docker-compose.yaml run --rm --entrypoint /bin/sh airbar_server \
  -c "./server --mode=production --server-id=prod-001 --logging=normal --role=monolith --apply-migrations"

# 6. Redémarrer
docker compose -f ./docker-compose.yaml restart airbar_server

# 7. Tester
curl http://localhost:8080/
docker compose -f ./docker-compose.yaml logs -f airbar_server
```

---

## ⚙️ Configuration .env (CRITIQUE)

**Les valeurs DOIVENT correspondre à `config/passwords.yaml` section `production` :**

```env
# Correspondance obligatoire avec passwords.yaml
POSTGRES_PASSWORD=-g4x7Ke0FV68yDNSi1xDQpirxejC2580
REDIS_PASSWORD=VotreMotDePasseRedisSecurise456!
SERVERPOD_PASSWORD_SHARED=k7N45MLCfD2PNbl_IvKc2bYwqn9FM05i
SERVERPOD_PASSWORD_SERVICE_SECRET=k7N45MLCfD2PNbl_IvKc2bYwqn9FM05i
SERVERPOD_PASSWORD_JWT_REFRESH_PEPPER=XlrfjPF3mW_lfHT355US_dpcVLxgStfc
SERVERPOD_PASSWORD_JWT_HMAC_SHA512_PRIVATE_KEY=QjjCRgRcEwJcjwH2sjbxF9n24TLvIpYL
SERVERPOD_PASSWORD_EMAIL_SECRET_HASH_PEPPER=9j7p2HCkJevye1Eo8GndwhKSaw7X2SKd
```

**Vérifier la correspondance :**

```bash
# Afficher les mots de passe dans passwords.yaml
cat config/passwords.yaml | grep -A 8 "production:"

# Comparer avec .env
cat .env | grep PASSWORD
```

---

## 🐛 Dépannage rapide

### Erreur : "password authentication failed"

```bash
# Réinitialiser PostgreSQL avec le bon mot de passe
docker compose down
docker volume rm airbar_backend_server_postgres_data
docker compose up -d
sleep 15
docker compose run --rm --entrypoint /bin/sh airbar_server \
  -c "./server --mode=production --apply-migrations"
```

### Erreur : "No such file or directory: endpoints.dart"

```bash
# Vérifier que les fichiers générés existent
ls lib/src/generated/endpoints.dart
ls lib/src/generated/protocol.dart

# Si absents, pull la dernière version
git pull origin prod

# Si toujours absents, vérifier .gitignore
cat ../.gitignore | grep generated
# La ligne **/generated/ NE DOIT PAS être présente
```

### Le serveur redémarre en boucle

```bash
# Voir les erreurs
docker compose logs --tail 200 airbar_server

# Vérifier l'état des services
docker compose ps
```

---

## 📋 Commandes utiles

```bash
# État des services
docker compose ps

# Logs en temps réel
docker compose logs -f

# Redémarrer
docker compose restart

# Arrêter
docker compose down

# Mettre à jour
git pull origin prod
docker compose down && docker compose up -d --build

# Sauvegarder la BDD
docker exec airbar_postgres_prod pg_dump -U postgres -d airbar_backend -F c -f /tmp/backup.dump
docker cp airbar_postgres_prod:/tmp/backup.dump ./backup_$(date +%Y%m%d).dump

# Nettoyer Docker
docker system prune -a
```

---

## ✅ Vérifications post-installation

| Service | Vérification | Commande |
|---------|--------------|----------|
| **API** | HTTP 200 | `curl http://localhost:8080/` |
| **Insights** | Dashboard web | Navigateur : `http://localhost:8081` |
| **PostgreSQL** | Connexion OK | `docker compose exec postgres psql -U postgres -d airbar_backend` |
| **Redis** | Ping OK | `docker compose exec redis redis-cli -a "PASSWORD" ping` |
| **Logs** | Pas d'erreur | `docker compose logs airbar_server` |

---

## 🔐 Sécurité (Production)

**⚠️ AVANT LA VRAIE PRODUCTION :**

```bash
# 1. Générer de nouveaux mots de passe forts
openssl rand -base64 32  # Répéter pour chaque secret

# 2. Mettre à jour config/passwords.yaml ET .env

# 3. Configurer pare-feu (Linux)
sudo ufw allow ssh
sudo ufw allow 8080,8081,8082/tcp
sudo ufw enable

# 4. Installer reverse proxy + SSL (Nginx + Let's Encrypt)
# Voir guide complet : installation_serveur_production.md

# 5. Configurer sauvegardes automatiques (cron)
crontab -e
# Ajouter : 0 2 * * * /chemin/vers/script_backup.sh
```

---

## 📚 Documentation complète

Pour installation détaillée avec explications : **`installation_serveur_production.md`**

---

**Dernière mise à jour :** 2026-08-16
