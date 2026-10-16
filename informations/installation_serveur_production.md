# Guide d'Installation AirBar Backend - Production

## Installation Serveur Local ou Distant (Windows / Linux)

**Version:** 3.0
**Date:** 2026-10-12
**Testé sur:** Windows 10/11, Ubuntu 22.04/24.04

---

## 📋 Table des matières

1. [Vue d&#39;ensemble](#vue-densemble)
2. [Prérequis](#prérequis)
3. [Installation des outils](#installation-des-outils)
4. [Configuration initiale](#configuration-initiale)
5. [Déploiement](#déploiement)
6. [Vérification et tests](#vérification-et-tests)
7. [Dépannage](#dépannage)
8. [Maintenance](#maintenance)

---

## 🎯 Vue d'ensemble

### Architecture de déploiement

```
┌───────────────────────────────────────────────────────────┐
│  SERVEUR (Windows ou Linux)                               │
│  ┌───────────────────────────────────────────────────┐    │
│  │  Docker Engine                                     │    │
│  │  ┌──────────┐  ┌──────────┐  ┌─────────┐ ┌──────┐ │    │
│  │  │PostgreSQL│  │  Redis   │  │ AirBar  │ │Caddy │ │    │
│  │  │  :5432   │  │  :6379   │  │ Server  │ │ :443 │◄┼────┼── Internet (HTTPS uniquement)
│  │  │          │  │          │  │:8080-82 │ │ TLS  │ │    │
│  │  └──────────┘  └──────────┘  └────▲────┘ └──┬───┘ │    │
│  │                                   └──────────┘     │    │
│  │                            (reverse proxy interne)  │    │
│  └───────────────────────────────────────────────────┘    │
└───────────────────────────────────────────────────────────┘
```

**Depuis la version 3.0 :** seul le port **443 (HTTPS)** est exposé publiquement. Caddy termine le TLS avec sa propre CA locale (`tls internal`, aucun nom de domaine requis) et relaie le trafic vers `airbar_server:8080` à l'intérieur du réseau Docker. Les ports 8080 (API), 8081 (Insights) et 8082 (Web) ne sont plus accessibles depuis l'extérieur.

L'application Flutter épingle (certificate pinning) le certificat racine de cette CA locale : elle n'accepte que ce certificat précis, jamais une CA publique quelconque — voir [Déploiement](#déploiement) pour la procédure d'extraction/épinglage.

### Deux types d'installation

| Type              | Scénario                                                | Outils requis                           |
| ----------------- | -------------------------------------------------------- | --------------------------------------- |
| **Local**   | Machine de développement ou serveur physique accessible | Git + Docker + Dart/Flutter (optionnel) |
| **Distant** | Serveur VPS/Cloud accessible via SSH                     | Git + Docker uniquement                 |

### ⚠️ Point critique : Fichiers générés par Serverpod

**Depuis la version 4.0.3 de Serverpod**, les fichiers générés (`lib/src/generated/`) **DOIVENT être versionnés dans Git** pour un déploiement Docker sans Flutter.

**Pourquoi ?** La génération de code nécessite Flutter, mais Docker utilise une image Dart légère (~200MB vs ~2GB avec Flutter). Les fichiers générés sont donc créés en développement puis versionnés.

---

## 🔧 Prérequis

### Serveur Local (Windows ou Linux)

- **OS:** Windows 10/11 64-bit OU Linux (Ubuntu 22.04+, Debian 11+)
- **RAM:** 4 Go minimum, 8 Go recommandé
- **Disque:** 20 Go libres
- **Droits:** Administrateur (Windows) ou sudo (Linux)
- **Internet:** Connexion stable

### Serveur Distant (Linux uniquement)

- **OS:** Ubuntu 22.04+ ou Debian 11+
- **Accès:** SSH avec clés publiques (recommandé) ou mot de passe
- **RAM:** 4 Go minimum, 8 Go recommandé
- **Disque:** 20 Go libres
- **Ports:** 443 (HTTPS, Caddy) ouvert dans le pare-feu — 8080/8081/8082 restent internes au réseau Docker et NE DOIVENT PAS être exposés publiquement

---

## 📦 Installation des outils

### Option A : Windows (Local)

#### 1. Installer Git

1. Télécharger depuis https://git-scm.com/download/win
2. Exécuter l'installateur avec les options par défaut
3. Vérifier l'installation :

```powershell
git --version
# Attendu: git version 2.x.x
```

#### 2. Installer Docker Desktop

1. Télécharger depuis https://www.docker.com/products/docker-desktop/
2. Exécuter l'installateur
3. **Important:** Accepter l'utilisation de WSL2 (Windows Subsystem for Linux)
4. Redémarrer Windows si demandé
5. Lancer Docker Desktop et attendre l'état **"Running"** (icône verte)
6. Vérifier l'installation :

```powershell
docker --version
# Attendu: Docker version 24.x.x

docker compose version
# Attendu: Docker Compose version v2.x.x
```

**⚠️ Si `docker compose` n'est pas reconnu :** Fermez et rouvrez PowerShell après le démarrage de Docker Desktop.

#### 3. (Optionnel) Installer Dart et Flutter

**Nécessaire uniquement si vous modifiez le code serveur localement.**

- Flutter SDK: https://docs.flutter.dev/get-started/install/windows
- Dart est inclus avec Flutter

---

### Option B : Linux (Local ou Distant)

#### 1. Se connecter au serveur

**Serveur local :** Ouvrir un terminal
**Serveur distant :** Se connecter via SSH

```bash
ssh utilisateur@adresse-ip-serveur
```

#### 2. Installer Git

```bash
sudo apt update
sudo apt install -y git
git --version
```

#### 3. Installer Docker Engine + Docker Compose Plugin

```bash
# Installer les dépendances
sudo apt install -y ca-certificates curl gnupg

# Ajouter la clé GPG officielle de Docker
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

# Ajouter le dépôt Docker
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo $VERSION_CODENAME) stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Installer Docker
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Vérifier l'installation
docker --version
docker compose version
```

#### 4. Configurer les permissions Docker (optionnel mais recommandé)

```bash
# Ajouter l'utilisateur au groupe docker pour éviter sudo
sudo usermod -aG docker $USER

# Appliquer les changements (déconnexion/reconnexion)
newgrp docker

# Vérifier
docker ps
# Doit fonctionner sans erreur de permission
```

---

## ⚙️ Configuration initiale

### 🌿 Quelle branche utiliser ?

Deux branches de production coexistent actuellement, **non fusionnées entre elles** :

| Branche | Contenu |
|---|---|
| **`prod`** | Stable actuelle, accès HTTP direct sur le port 8080 (sans Caddy/TLS/pinning) |
| **`securite`** | Nouvelle architecture Caddy + TLS (CA locale) + certificate pinning, voir [migration_http_vers_caddy_tls.md](migration_http_vers_caddy_tls.md) |

Dans toutes les commandes ci-dessous, remplacez `<branche>` par `prod` ou `securite` selon celle que vous souhaitez déployer.

### 1. Récupérer le code source

#### Windows (PowerShell)

```powershell
# Créer le dossier de travail
cd C:\
mkdir airbar_production
cd airbar_production

# Cloner le dépôt (remplacer <branche> par prod ou securite)
git clone -b <branche> --single-branch https://github.com/rorophil/airbar_backend.git
cd .\airbar_backend\airbar_backend_server

# Vérifier la structure
dir
```

#### Linux (Bash)

```bash
# Créer le dossier de travail
mkdir -p ~/airbar_production
cd ~/airbar_production

# Cloner le dépôt (remplacer <branche> par prod ou securite)
git clone -b <branche> --single-branch https://github.com/rorophil/airbar_backend.git
cd airbar_backend/airbar_backend_server

# Vérifier la structure
ls -la
```

> **💡 Optimisation :** L'option `--single-branch` télécharge uniquement la branche choisie, ce qui réduit le temps de clonage et l'espace disque utilisé (on évite de télécharger toutes les branches de développement inutiles sur le serveur de production).

**Fichiers attendus :**

- `docker-compose.yaml`
- `Dockerfile`
- `config/production.yaml`
- `config/passwords.yaml`
- `.env.example`

### 2. Vérifier les fichiers générés (CRITIQUE)

```bash
# Les fichiers suivants DOIVENT exister
ls lib/src/generated/endpoints.dart
ls lib/src/generated/protocol.dart
ls lib/src/generated/protocol.yaml
```

**❌ Si ces fichiers n'existent pas :**

```bash
# Vérifier que vous avez bien la dernière version
git pull origin <branche>

# Vérifier le .gitignore à la racine du workspace
cat ../.gitignore | grep generated
```

**La ligne `**/generated/` NE DOIT PAS être présente** dans le `.gitignore` principal (à la racine du workspace, pas celui du serveur).

Si les fichiers générés sont absents et que vous avez Dart/Flutter installés :

```bash
# En développement local seulement
cd ..  # Retour à la racine du workspace
serverpod generate
cd airbar_backend_server
```

### 3. Configurer les secrets de production

#### Étape 3.1 : Examiner `config/passwords.yaml`

```bash
# Afficher les mots de passe de production actuels
cat config/passwords.yaml | grep -A 10 "production:"
```

**Exemple de sortie :**

```yaml
production:
  database: '-g4x7Ke0FV68yDNSi1xDQpirxejC2580'
  serviceSecret: 'k7N45MLCfD2PNbl_IvKc2bYwqn9FM05i'
  emailSecretHashPepper: '9j7p2HCkJevye1Eo8GndwhKSaw7X2SKd'
  jwtHmacSha512PrivateKey: 'QjjCRgRcEwJcjwH2sjbxF9n24TLvIpYL'
  jwtRefreshTokenHashPepper: 'XlrfjPF3mW_lfHT355US_dpcVLxgStfc'
```

#### Étape 3.2 : Créer le fichier `.env`

**⚠️ CRITIQUE :** Les valeurs dans `.env` **DOIVENT** correspondre EXACTEMENT à celles dans `config/passwords.yaml` section `production`.

**Windows (PowerShell) :**

```powershell
# Copier le template
copy .env.example .env

# Éditer avec notepad
notepad .env
```

**Linux (Bash) :**

```bash
# Copier le template
cp .env.example .env

# Éditer avec nano ou vim
nano .env
```

**Contenu du fichier `.env` :**

```env
# ============================================
# AIRBAR BACKEND - CONFIGURATION PRODUCTION
# ============================================
# ⚠️ ATTENTION : Les valeurs ci-dessous DOIVENT
# correspondre à config/passwords.yaml (section production)

# Mode Serverpod pour CE serveur : "production" pour le vrai serveur,
# "staging" pour un serveur de test grandeur nature (même docker-compose.yaml)
RUNMODE=production
SERVER_ID=prod-001

# Adresse IP PUBLIQUE de ce serveur : utilisée par Caddy pour émettre
# son certificat TLS local (SAN = cette IP). Pas de nom de domaine requis.
PUBLIC_ADDRESS=203.0.113.10

# PostgreSQL - Base de données principale
# Doit correspondre à : passwords.yaml -> production -> database
POSTGRES_PASSWORD=-g4x7Ke0FV68yDNSi1xDQpirxejC2580

# Redis - Cache et sessions
REDIS_PASSWORD=VotreMotDePasseRedisSecurise456!

# Serverpod - Clé partagée entre serveurs
# Doit correspondre à : passwords.yaml -> production -> serviceSecret
SERVERPOD_PASSWORD_SHARED=k7N45MLCfD2PNbl_IvKc2bYwqn9FM05i

# Serverpod - Secret de service (même valeur que SHARED)
SERVERPOD_PASSWORD_SERVICE_SECRET=k7N45MLCfD2PNbl_IvKc2bYwqn9FM05i

# JWT - Pepper pour refresh tokens
# Doit correspondre à : passwords.yaml -> production -> jwtRefreshTokenHashPepper
SERVERPOD_PASSWORD_JWT_REFRESH_PEPPER=XlrfjPF3mW_lfHT355US_dpcVLxgStfc

# JWT - Clé privée HMAC SHA512
# Doit correspondre à : passwords.yaml -> production -> jwtHmacSha512PrivateKey
SERVERPOD_PASSWORD_JWT_HMAC_SHA512_PRIVATE_KEY=QjjCRgRcEwJcjwH2sjbxF9n24TLvIpYL

# Email - Pepper pour hash des secrets email
# Doit correspondre à : passwords.yaml -> production -> emailSecretHashPepper
SERVERPOD_PASSWORD_EMAIL_SECRET_HASH_PEPPER=9j7p2HCkJevye1Eo8GndwhKSaw7X2SKd
```

#### Étape 3.3 : Sécuriser le fichier `.env`

**Windows :**

```powershell
# Vérifier que le fichier n'est pas versionné
git status .env
# Doit afficher : "Untracked files" ou rien (si dans .gitignore)
```

**Linux :**

```bash
# Restreindre les permissions (lecture seule pour le propriétaire)
chmod 600 .env

# Vérifier
ls -la .env
# Attendu: -rw------- 1 user user ...
```

### 4. Vérifier la configuration Serverpod

Examinez `config/production.yaml` :

```bash
cat config/production.yaml
```

**Points à vérifier :**

```yaml
apiServer:
  port: 8080
  publicHost: 203.0.113.10       # ⚠️ Remplacer par l'IP publique réelle (= PUBLIC_ADDRESS du .env)
  publicPort: 443                # ✅ Port public = celui de Caddy, pas 8080
  publicScheme: https            # ✅ HTTPS géré par Caddy

database:
  host: postgres                 # ✅ Ne pas changer (nom du service Docker)
  port: 5432
  name: airbar_backend
  user: postgres
  requireSsl: false              # ✅ Normal : la connexion postgres<->serveur reste interne au réseau Docker

redis:
  enabled: true
  host: redis                    # ✅ Ne pas changer (nom du service Docker)
  port: 6379
```

**Fichier `Caddyfile` (reverse proxy TLS) :** vérifiez qu'il existe bien à la racine de `airbar_backend_server/` et qu'il utilise la variable `${PUBLIC_ADDRESS}` :

```bash
cat Caddyfile
```

```caddyfile
{
	default_sni {$PUBLIC_ADDRESS}
}

{$PUBLIC_ADDRESS}:443 {
	tls internal
	reverse_proxy airbar_server:8080
}
```

> `default_sni` est indispensable : une connexion par adresse IP (sans nom de domaine) n'envoie pas de SNI TLS, Caddy a donc besoin de cette option pour savoir quel certificat présenter. Sans elle, le handshake TLS échoue avec une erreur `alert internal error` (voir [Dépannage](#dépannage)).

---

## 🚀 Déploiement

### 1. Construire et démarrer les services

**Windows (PowerShell) :**

```powershell
cd C:\airbar_production\airbar_backend\airbar_backend_server

# Build et démarrage en arrière-plan
docker compose -f .\docker-compose.yaml up -d --build

# Suivre les logs en temps réel
docker compose -f .\docker-compose.yaml logs -f
```

**Linux (Bash) :**

```bash
cd ~/airbar_production/airbar_backend/airbar_backend_server

# Build et démarrage en arrière-plan
docker compose -f ./docker-compose.yaml up -d --build

# Suivre les logs en temps réel
docker compose -f ./docker-compose.yaml logs -f
```

**Sortie attendue (après 30-60 secondes) :**

```
✔ Network airbar_backend_server_airbar_network  Created
✔ Volume airbar_backend_server_postgres_data    Created
✔ Volume airbar_backend_server_redis_data       Created
✔ Volume airbar_backend_server_caddy_data        Created
✔ Volume airbar_backend_server_caddy_config      Created
✔ Container airbar_postgres_prod                Healthy
✔ Container airbar_redis_prod                   Healthy
✔ Container airbar_backend_production            Started
✔ Container airbar_caddy_production               Started
```

### 2. Vérifier l'état des services

**Commande :**

```bash
# Windows
docker compose -f .\docker-compose.yaml ps

# Linux
docker compose -f ./docker-compose.yaml ps
```

**État attendu :**

```
NAME                        STATUS              PORTS
airbar_postgres_prod        Up (healthy)        0.0.0.0:5432->5432/tcp
airbar_redis_prod           Up (healthy)        0.0.0.0:6379->6379/tcp
airbar_backend_production  Up                  8080-8082/tcp (internes, non publiés)
airbar_caddy_production     Up                  0.0.0.0:443->443/tcp
```

**✅ Tous les services doivent être "Up"**
**✅ PostgreSQL et Redis doivent être "healthy"**
**✅ Seul `caddy` doit publier un port sur l'hôte (443) — `airbar_server` ne doit avoir aucun port publié**

### 3. Appliquer les migrations de base de données

**⚠️ À exécuter UNIQUEMENT au premier déploiement ou après mise à jour du schéma**

**Windows (PowerShell) :**

```powershell
docker compose -f .\docker-compose.yaml run --rm --entrypoint /bin/sh airbar_server `
  -c "./server --mode=production --server-id=prod-001 --logging=normal --role=monolith --apply-migrations"
```

**Linux (Bash) :**

```bash
docker compose -f ./docker-compose.yaml run --rm --entrypoint /bin/sh airbar_server \
  -c "./server --mode=production --server-id=prod-001 --logging=normal --role=monolith --apply-migrations"
```

**Sortie attendue :**

```
SERVERPOD version: 4.0.3
runMode: production
serverId: prod-001
applyMigrations: true
SERVERPOD initialized

Applying migrations...
✓ Migration 20260303162143579 applied successfully
✓ Migration 20260303165531206 applied successfully
[...]
All migrations applied successfully
```

**❌ Si erreur "password authentication failed" :**

Voir section [Dépannage - Problème d&#39;authentification PostgreSQL](#problème-dauthentification-postgresql)

### 4. Redémarrer le serveur

```bash
# Windows
docker compose -f .\docker-compose.yaml restart airbar_server

# Linux
docker compose -f ./docker-compose.yaml restart airbar_server
```

### 5. Extraire et sauvegarder la CA locale Caddy (à faire une fois)

Caddy génère sa propre autorité de certification locale au premier démarrage. Il faut l'extraire pour l'épingler (certificate pinning) dans l'application Flutter, et la sauvegarder en lieu sûr.

```bash
# Depuis le dossier airbar_backend_server, sur le serveur (local ou distant via SSH)
docker compose cp caddy:/data/caddy/pki/authorities/local/root.crt ./root.crt
docker compose cp caddy:/data/caddy/pki/authorities/local/root.key ./root.key

# Vérifier leur présence avant de passer à la suite
ls -la root.crt root.key
```

**Sauvegarder la CA hors du serveur**, sur une machine de confiance — la procédure diffère selon le type d'installation :

**Serveur local** (vous êtes déjà sur la machine, un simple `cp` suffit à sortir le fichier du dépôt Git vers un dossier non versionné) :

```bash
mkdir -p ~/AirBar-Secrets-Backup/production
cp root.crt root.key ~/AirBar-Secrets-Backup/production/
chmod 600 ~/AirBar-Secrets-Backup/production/root.key
```

**Serveur distant (accessible via SSH)** : un `cp` exécuté sur le serveur ne fait que déplacer la CA d'un dossier à l'autre **sur cette même machine** — ça ne protège pas contre une compromission du serveur lui-même. Il faut rapatrier les fichiers vers votre poste local via `scp`, donc exécuter ces commandes **depuis votre poste local**, pas depuis le serveur :

```bash
# Depuis votre poste local (pas le serveur)
mkdir -p ~/AirBar-Secrets-Backup/production
scp utilisateur@adresse-ip-serveur:~/airbar_production/airbar_backend/airbar_backend_server/root.crt ~/AirBar-Secrets-Backup/production/root.crt
scp utilisateur@adresse-ip-serveur:~/airbar_production/airbar_backend/airbar_backend_server/root.key ~/AirBar-Secrets-Backup/production/root.key
chmod 600 ~/AirBar-Secrets-Backup/production/root.key
```

Une fois la sauvegarde hors serveur confirmée, vous pouvez supprimer les copies restées sur le serveur distant (`rm root.crt root.key`) : ce ne sont que des extractions dérivées, reproductibles à tout moment depuis le volume `caddy_data` tant qu'il n'est pas supprimé (`docker compose down -v`).

⚠️ **Ne jamais réutiliser la même CA entre l'environnement de test (staging) et la production.** Chaque environnement a sa propre CA locale, générée indépendamment par son propre conteneur Caddy.

**Épingler le certificat dans l'application Flutter :**

```bash
cp root.crt "<chemin-vers-le-repo-airbar>/assets/certs/production_root_ca.pem"
```

Puis recompiler/republier l'application (`flutter build ...`). Le `ServerpodClientProvider` côté Flutter charge automatiquement ce fichier et n'accepte que cette CA (`SecurityContext(withTrustedRoots: false)`), ce qui bloque toute interception (MITM) même avec un certificat émis par une CA publique valide.

---

## ✅ Vérification et tests

### 1. Vérifier les logs du serveur

```bash
# Windows
docker compose -f .\docker-compose.yaml logs --tail 100 airbar_server

# Linux
docker compose -f ./docker-compose.yaml logs --tail 100 airbar_server
```

**Logs attendus (succès) :**

```
SERVERPOD version: 4.0.3
runMode: production
serverId: prod-001
SERVERPOD started
API Server listening on port 8080
Insights Server listening on port 8081
Web Server listening on port 8082
```

**❌ Erreurs à surveiller :**

- `password authentication failed` → Voir [Dépannage](#problème-dauthentification-postgresql)
- `No such file or directory: endpoints.dart` → Voir [Dépannage](#fichiers-générés-manquants)
- `relation "users" does not exist` → Relancer les migrations

### 2. Tester l'API (Health Check)

**Depuis le serveur :**

```bash
curl -k https://localhost/
```

**Depuis un autre poste (si le pare-feu autorise le port 443) :**

```bash
curl -k https://adresse-ip-serveur/
```

Le `-k` est normal tant que le certificat racine de Caddy n'est pas installé localement : c'est un certificat auto-signé, destiné au pinning côté app plutôt qu'à une validation par une CA publique.

**Réponse attendue :**

```json
{"status":"ok","version":"4.0.3"}
```

### 3. Accéder à Serverpod Insights (monitoring)

Depuis la version 3.0, Insights (port 8081) n'est plus exposé publiquement (seul Caddy/443 l'est). Pour y accéder malgré tout, ouvrez un tunnel SSH vers le serveur :

```bash
ssh -L 8081:localhost:8081 utilisateur@adresse-ip-serveur
```

Puis, dans un navigateur sur votre poste local :

```
http://localhost:8081
```

**Page attendue :** Dashboard Serverpod Insights avec graphiques de performances

### 4. Vérifier les données de base

**Connexion à PostgreSQL :**

```bash
# Windows
docker compose -f .\docker-compose.yaml exec postgres psql -U postgres -d airbar_backend

# Linux
docker compose -f ./docker-compose.yaml exec postgres psql -U postgres -d airbar_backend
```

**Commandes SQL de vérification :**

```sql
-- Lister les tables
\dt

-- Vérifier les utilisateurs
SELECT * FROM serverpod_user_info;

-- Quitter
\q
```

---

## 🔧 Dépannage

### Erreur TLS « alert internal error » (Caddy)

**Symptôme :**

```
curl: (35) TLS connect error: error:0A000438:SSL routines::tlsv1 alert internal error
```

même en se connectant depuis le serveur lui-même, avec un certificat Caddy parfaitement valide.

**Cause :** une connexion par adresse IP littérale (sans nom de domaine) n'envoie **aucune SNI** dans le ClientHello TLS (RFC 6066). Caddy a besoin de la SNI — ou de l'adresse locale de la connexion — pour choisir quel certificat présenter. Derrière le NAT de Docker, l'adresse locale vue par le conteneur n'est jamais l'IP publique de l'hôte, donc ce mécanisme de repli échoue aussi.

**Solution :** ajouter l'option globale `default_sni` dans le `Caddyfile` :

```caddyfile
{
	default_sni {$PUBLIC_ADDRESS}
}

{$PUBLIC_ADDRESS}:443 {
	tls internal
	reverse_proxy airbar_server:8080
}
```

Puis redémarrer uniquement Caddy (pas besoin de rebuild, le fichier est monté en volume) :

```bash
docker compose restart caddy
curl -k https://localhost/
```

### Problème d'authentification PostgreSQL

**Symptôme :**

```
ERROR: password authentication failed for user "postgres"
```

**Cause :** Le mot de passe dans `.env` ne correspond pas au mot de passe configuré dans PostgreSQL.

**Solution 1 : Réinitialiser PostgreSQL (RECOMMANDÉ au premier déploiement)**

```bash
# 1. Arrêter tous les services
docker compose down

# 2. Supprimer le volume PostgreSQL (⚠️ PERTE DE DONNÉES)
docker volume rm airbar_backend_server_postgres_data

# 3. Vérifier le fichier .env
cat .env | grep POSTGRES_PASSWORD
# Doit correspondre à passwords.yaml -> production -> database

# 4. Redémarrer avec le bon mot de passe
docker compose up -d

# 5. Attendre que PostgreSQL soit healthy (15-20 secondes)
docker compose ps

# 6. Relancer les migrations
docker compose run --rm --entrypoint /bin/sh airbar_server \
  -c "./server --mode=production --server-id=prod-001 --logging=normal --role=monolith --apply-migrations"
```

**Solution 2 : Modifier le mot de passe PostgreSQL existant**

```bash
# 1. Se connecter à PostgreSQL (avec l'ancien mot de passe si possible)
docker compose exec postgres psql -U postgres

# 2. Changer le mot de passe
ALTER USER postgres WITH PASSWORD 'nouveau-mot-de-passe-depuis-env';
\q

# 3. Mettre à jour .env avec le nouveau mot de passe
nano .env  # ou notepad .env sur Windows

# 4. Redémarrer le serveur
docker compose restart airbar_server
```

### Fichiers générés manquants

**Symptôme :**

```
Error when reading 'lib/src/generated/endpoints.dart': No such file or directory
```

**Cause :** Les fichiers générés par Serverpod ne sont pas présents dans le code source.

**Solution :**

1. **Vérifier le .gitignore du workspace** (à la racine, pas dans airbar_backend_server)

```bash
cd ~/airbar_production/airbar_backend  # Linux
cd C:\airbar_production\airbar_backend  # Windows

cat .gitignore | grep generated
```

**La ligne `**/generated/` NE DOIT PAS être présente.** Si elle existe, la supprimer :

```bash
# Éditer .gitignore et retirer la ligne **/generated/
nano .gitignore  # Linux
notepad .gitignore  # Windows
```

2. **Régénérer et versionner les fichiers (en développement local uniquement)**

```bash
# Nécessite Dart + Flutter installés
serverpod generate

# Vérifier que les fichiers sont créés
ls airbar_backend_server/lib/src/generated/

# Ajouter au Git
git add airbar_backend_server/lib/src/generated/
git commit -m "chore: add generated files for production deployment"
git push origin <branche>
```

3. **Sur le serveur distant, récupérer les fichiers**

```bash
git pull origin <branche>
docker compose up -d --build
```

### Le serveur redémarre en boucle

**Diagnostic :**

```bash
docker compose logs --tail 200 airbar_server
```

**Causes possibles :**

1. **Erreur de migration** → Vérifier les logs, corriger le schéma
2. **Problème de connexion BDD** → Vérifier PostgreSQL/Redis
3. **Configuration incorrecte** → Vérifier `production.yaml`
4. **Mémoire insuffisante** → Augmenter la RAM du serveur

### Docker Compose non reconnu (Windows)

**Symptôme :**

```
'docker' is not recognized as an internal or external command
```

**Solution :**

1. Vérifier que Docker Desktop est **démarré** (icône verte dans la barre des tâches)
2. Fermer et rouvrir PowerShell
3. Redémarrer Windows si nécessaire

### Permission denied (Linux)

**Symptôme :**

```
permission denied while trying to connect to the Docker daemon socket
```

**Solution :**

```bash
# Ajouter l'utilisateur au groupe docker
sudo usermod -aG docker $USER

# Appliquer les changements
newgrp docker

# Ou se déconnecter/reconnecter
exit
ssh utilisateur@serveur
```

---

## 🔄 Maintenance

### Arrêter les services

```bash
# Windows
docker compose -f .\docker-compose.yaml down

# Linux
docker compose -f ./docker-compose.yaml down
```

### Redémarrer les services

```bash
# Windows
docker compose -f .\docker-compose.yaml restart

# Linux
docker compose -f ./docker-compose.yaml restart
```

### Mettre à jour le code

```bash
# 1. Sauvegarder la base de données
docker exec airbar_postgres_prod pg_dump -U postgres -d airbar_backend -F c -f /tmp/backup.dump
docker cp airbar_postgres_prod:/tmp/backup.dump ./backup_$(date +%Y%m%d_%H%M%S).dump

# 2. Se placer dans le dossier du dépôt, récupérer les mises à jour
cd ~/airbar_production/airbar_backend
git pull origin <branche>

# 3. Rebuild et redémarrage (depuis airbar_backend_server)
cd airbar_backend_server
docker compose down
docker compose up -d --build

# 4. Appliquer les nouvelles migrations (si nécessaire)
docker compose run --rm --entrypoint /bin/sh airbar_server \
  -c "./bin/server --mode=production --server-id=prod-001 --logging=normal --role=monolith --apply-migrations"
```

> Le Caddyfile et les volumes `caddy_data`/`caddy_config` ne sont pas affectés par un `docker compose down` (sans `-v`) : la CA locale persiste entre les mises à jour.

### Sauvegarder la base de données

```bash
# Créer le dossier backups
mkdir -p backups

# Dump PostgreSQL
docker exec airbar_postgres_prod pg_dump -U postgres -d airbar_backend -F c -f /tmp/backup.dump

# Copier localement
docker cp airbar_postgres_prod:/tmp/backup.dump ./backups/airbar_$(date +%Y%m%d_%H%M%S).dump
```

### Restaurer une sauvegarde

```bash
# Copier le backup dans le conteneur
docker cp ./backups/airbar_20260816_120000.dump airbar_postgres_prod:/tmp/restore.dump

# Restaurer
docker exec airbar_postgres_prod pg_restore -U postgres -d airbar_backend -c /tmp/restore.dump
```

### Sauvegarder/vérifier la CA Caddy

La CA locale (`root.crt`/`root.key`) est générée une seule fois et persistée dans le volume `caddy_data`. Elle ne doit être renouvelée qu'en cas de compromission suspectée. Vérifier périodiquement que la sauvegarde externe est toujours à jour.

**Serveur local** (la sauvegarde `~/AirBar-Secrets-Backup/production/` est sur la même machine) :

```bash
diff <(docker compose cp caddy:/data/caddy/pki/authorities/local/root.crt -) ~/AirBar-Secrets-Backup/production/root.crt
```

**Serveur distant (accessible via SSH)** : la sauvegarde est sur votre poste local, pas sur le serveur — exécutez la comparaison depuis votre poste local en lisant le certificat du serveur à travers SSH :

```bash
# Depuis votre poste local (pas le serveur)
ssh utilisateur@adresse-ip-serveur 'cd ~/airbar_production/airbar_backend/airbar_backend_server && docker compose cp caddy:/data/caddy/pki/authorities/local/root.crt -' | diff - ~/AirBar-Secrets-Backup/production/root.crt
```

Aucune différence attendue tant que le volume `caddy_data` n'a pas été recréé (`docker compose down -v` supprimerait la CA — à éviter en production).

### Voir les logs en temps réel

```bash
# Tous les services
docker compose logs -f

# Serveur uniquement
docker compose logs -f airbar_server

# PostgreSQL uniquement
docker compose logs -f postgres
```

### Nettoyer les ressources Docker

```bash
# Supprimer les images non utilisées
docker system prune -a

# Supprimer les volumes orphelins
docker volume prune
```

---

## 🔐 Sécurité - Checklist Production

### ⚠️ AVANT LA MISE EN PRODUCTION RÉELLE

- [ ] **Changer TOUS les mots de passe** dans `config/passwords.yaml` ET `.env`
- [ ] **Utiliser des mots de passe de 32+ caractères** générés aléatoirement
- [ ] **Configurer un pare-feu** (UFW sur Linux, Windows Firewall) — seul le port 443 doit être ouvert publiquement
- [x] **TLS géré automatiquement par Caddy** (`tls internal` + `default_sni`, pas de nom de domaine requis)
- [ ] **Sauvegarder la CA Caddy** (`root.crt`/`root.key`) hors du serveur et hors de tout dépôt Git, avec `chmod 600` sur la clé
- [ ] **Épingler le certificat de production** dans `airbar/assets/certs/production_root_ca.pem` et vérifier que l'app refuse bien une CA différente (test négatif de pinning)
- [ ] **Configurer les sauvegardes automatiques** (cron job quotidien)
- [ ] **Restreindre l'accès SSH** (clés uniquement, désactiver mot de passe)
- [ ] **Configurer la surveillance** (monitoring, alertes)
- [ ] **Documenter les mots de passe** dans un gestionnaire sécurisé (1Password, Bitwarden)

### Générer des mots de passe forts

**Linux/macOS :**

```bash
# Générer un mot de passe de 32 caractères
openssl rand -base64 32
```

**Windows (PowerShell) :**

```powershell
# Générer un mot de passe de 32 caractères
-join ((48..57) + (65..90) + (97..122) | Get-Random -Count 32 | ForEach-Object {[char]$_})
```

### Configuration pare-feu (Linux)

```bash
# Installer UFW
sudo apt install -y ufw

# Configurer les règles
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow ssh
sudo ufw allow 443/tcp   # HTTPS (Caddy) - seul port à exposer publiquement
# Les ports 8080/8081/8082 sont internes au réseau Docker, ne pas les ouvrir

# Activer
sudo ufw enable
sudo ufw status
```

---

## 📞 Support et ressources

- **Documentation Serverpod :** https://docs.serverpod.dev
- **Docker Documentation :** https://docs.docker.com
- **Repository GitHub :** https://github.com/rorophil/airbar_backend
- **Issues :** https://github.com/rorophil/airbar_backend/issues

---

## 📝 Changelog

### Version 3.1 (2026-10-16)

- 🐛 Correction : l'extraction/sauvegarde de la CA Caddy (étape 5) et sa vérification périodique (section Maintenance) supposaient à tort un serveur local — un `cp` exécuté sur un serveur distant ne sort pas réellement la CA de ce serveur. Ajout de la procédure `scp`/`ssh` dédiée au cas « Serveur distant (SSH) », à exécuter depuis le poste local
- 🔎 Ajout d'une vérification de présence (`ls -la root.crt root.key`) juste après l'extraction

### Version 3.0 (2026-10-12)

- ✅ Ajout de Caddy comme reverse proxy TLS (`tls internal`, sans nom de domaine)
- ✅ Seul le port 443 est désormais exposé publiquement (8080-8082 internes)
- ✅ Variables `.env` `RUNMODE` et `PUBLIC_ADDRESS` (un même docker-compose.yaml pour staging et production)
- ✅ Procédure d'extraction, de sauvegarde et d'épinglage (certificate pinning) de la CA locale
- ✅ Nouvelle entrée de dépannage pour l'erreur TLS `alert internal error` (nécessité de `default_sni`)
- ✅ Accès à Serverpod Insights désormais via tunnel SSH (plus exposé publiquement)

### Version 2.0 (2026-08-16)

- ✅ Ajout de la procédure complète Windows et Linux
- ✅ Documentation du problème des fichiers générés
- ✅ Correction de l'erreur d'authentification PostgreSQL
- ✅ Ajout de la section sécurité complète
- ✅ Procédures de dépannage étendues

### Version 1.0 (2026-08-10)

- 🎉 Version initiale

---

**© 2026 AirBar Backend - Guide d'installation**
