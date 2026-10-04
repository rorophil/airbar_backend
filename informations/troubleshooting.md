# Guide de Dépannage AirBar Backend
## Résolution des problèmes courants

**Version:** 1.0  
**Date:** 2026-08-16

---

## 📋 Table des matières

1. [Problèmes de déploiement Docker](#problèmes-de-déploiement-docker)
2. [Problèmes d'authentification](#problèmes-dauthentification)
3. [Problèmes de compilation](#problèmes-de-compilation)
4. [Problèmes de base de données](#problèmes-de-base-de-données)
5. [Problèmes réseau](#problèmes-réseau)
6. [Diagnostics avancés](#diagnostics-avancés)

---

## 🐳 Problèmes de déploiement Docker

### ❌ Erreur : "docker compose command not found"

**Symptôme (Windows) :**
```
'docker' is not recognized as an internal or external command
```

**Symptôme (Linux) :**
```
docker: command not found
```

**Solutions :**

**Windows :**
1. Vérifier que Docker Desktop est **démarré** (icône dans la barre des tâches)
2. Fermer et rouvrir PowerShell
3. Si le problème persiste :
   ```powershell
   # Vérifier l'installation
   Get-Command docker
   
   # Redémarrer Docker Desktop
   # Puis redémarrer Windows si nécessaire
   ```

**Linux :**
```bash
# Vérifier si Docker est installé
which docker

# Si non installé, installer Docker
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin

# Si installé mais non accessible, vérifier les permissions
sudo usermod -aG docker $USER
newgrp docker
```

---

### ❌ Erreur : "permission denied while trying to connect to Docker daemon"

**Symptôme (Linux) :**
```
Got permission denied while trying to connect to the Docker daemon socket
```

**Cause :** L'utilisateur n'est pas dans le groupe `docker`.

**Solution :**
```bash
# Ajouter l'utilisateur au groupe docker
sudo usermod -aG docker $USER

# Appliquer immédiatement (sans déconnexion)
newgrp docker

# Vérifier
docker ps
```

**Si ça ne fonctionne toujours pas :**
```bash
# Redémarrer le daemon Docker
sudo systemctl restart docker

# Déconnexion/reconnexion
exit
ssh utilisateur@serveur
```

---

### ❌ Erreur : "network airbar_network not found"

**Cause :** Ancien déploiement incomplet ou nettoyage partiel.

**Solution :**
```bash
# Nettoyer complètement
docker compose down
docker network prune
docker volume prune

# Redéployer
docker compose up -d --build
```

---

## 🔐 Problèmes d'authentification

### ❌ Erreur : "password authentication failed for user postgres"

**Symptôme complet :**
```
ERROR: Failed to connect to the database.
ERROR: Severity.fatal 28P01: password authentication failed for user "postgres"
```

**Cause principale :** **Incohérence entre le mot de passe dans `.env` et celui configuré dans PostgreSQL.**

**Diagnostic :**

```bash
# 1. Vérifier le mot de passe dans .env
cat .env | grep POSTGRES_PASSWORD

# 2. Vérifier le mot de passe dans passwords.yaml
cat config/passwords.yaml | grep -A 8 "production:"

# 3. Vérifier le mot de passe actuel de PostgreSQL
docker compose exec postgres env | grep POSTGRES_PASSWORD
```

**Solution 1 : Réinitialisation complète (RECOMMANDÉ au premier déploiement)**

```bash
# ⚠️ ATTENTION : Cette méthode supprime toutes les données PostgreSQL

# 1. Arrêter les services
docker compose down

# 2. Supprimer le volume PostgreSQL
docker volume ls | grep postgres
docker volume rm airbar_backend_server_postgres_data

# 3. Vérifier la correspondance .env ↔ passwords.yaml
# POSTGRES_PASSWORD dans .env DOIT être identique à
# "database:" dans passwords.yaml section "production:"

# Exemple de vérification :
echo "=== .env ==="
cat .env | grep POSTGRES_PASSWORD
echo "=== passwords.yaml ==="
cat config/passwords.yaml | grep -A 1 "production:" | grep database

# 4. Si différents, corriger .env
nano .env  # ou notepad .env

# 5. Redémarrer avec le volume vide (PostgreSQL sera recréé)
docker compose up -d

# 6. Attendre que PostgreSQL soit healthy (15-20 secondes)
watch -n 2 docker compose ps  # Linux
# Ou vérifier manuellement toutes les 5 secondes sur Windows

# 7. Vérifier l'état
docker compose ps
# postgres doit être "Up (healthy)"

# 8. Appliquer les migrations
docker compose run --rm --entrypoint /bin/sh airbar_server \
  -c "./server --mode=production --server-id=prod-001 --logging=normal --role=monolith --apply-migrations"
```

**Solution 2 : Modifier le mot de passe PostgreSQL existant (conservation des données)**

```bash
# 1. Se connecter à PostgreSQL avec l'ancien mot de passe
# Essayer d'abord avec "1234" (mot de passe par défaut)
docker compose exec postgres psql -U postgres

# Si la connexion réussit :
# 2. Changer le mot de passe pour correspondre à .env
ALTER USER postgres WITH PASSWORD 'nouveau-mot-de-passe-depuis-env';
\q

# 3. Redémarrer le serveur AirBar
docker compose restart airbar_server

# 4. Vérifier les logs
docker compose logs -f airbar_server
```

**Solution 3 : Cas du serveur distant avec volume existant**

```bash
# Si PostgreSQL a été créé avec un ancien mot de passe

# Option A : Modifier directement dans le conteneur
docker compose exec postgres bash
psql -U postgres
ALTER USER postgres WITH PASSWORD '-g4x7Ke0FV68yDNSi1xDQpirxejC2580';
\q
exit

# Option B : Via variable d'environnement (ne fonctionne que si pas encore initialisé)
docker compose down
docker compose up -d postgres
docker compose exec postgres psql -U postgres -c "ALTER USER postgres PASSWORD '-g4x7Ke0FV68yDNSi1xDQpirxejC2580';"
```

**Checklist de vérification finale :**

- [ ] `POSTGRES_PASSWORD` dans `.env` = `database:` dans `passwords.yaml` (section production)
- [ ] PostgreSQL status = "Up (healthy)" (pas seulement "Up")
- [ ] Logs PostgreSQL sans erreur : `docker compose logs postgres`
- [ ] Connexion manuelle réussie : `docker compose exec postgres psql -U postgres`

---

### ❌ Erreur : "Missing password for ..."

**Symptôme :**
```
Missing password for database
Missing password for serviceSecret
```

**Cause :** Fichier `.env` manquant ou incomplet.

**Solution :**
```bash
# 1. Vérifier l'existence du fichier
ls -la .env

# 2. Si absent, créer depuis le template
cp .env.example .env

# 3. Éditer et compléter TOUTES les variables
nano .env  # Linux
notepad .env  # Windows

# 4. Vérifier que TOUTES les variables sont présentes
cat .env | grep PASSWORD

# Attendu (7 lignes minimum) :
# POSTGRES_PASSWORD=...
# REDIS_PASSWORD=...
# SERVERPOD_PASSWORD_SHARED=...
# SERVERPOD_PASSWORD_SERVICE_SECRET=...
# SERVERPOD_PASSWORD_JWT_REFRESH_PEPPER=...
# SERVERPOD_PASSWORD_JWT_HMAC_SHA512_PRIVATE_KEY=...
# SERVERPOD_PASSWORD_EMAIL_SECRET_HASH_PEPPER=...

# 5. Redémarrer
docker compose restart airbar_server
```

---

## 🛠️ Problèmes de compilation

### ❌ Erreur : "Failed to run serverpod. You need to have flutter installed"

**Symptôme complet :**
```
=> ERROR [airbar_server build 9/10] RUN dart pub global run serverpod_cli generate
ERROR: Failed to run serverpod. You need to have flutter installed and in your $PATH
```

**Cause :** Le Dockerfile essaie de générer le code Serverpod dans Docker, mais l'image Dart ne contient pas Flutter.

**Solution permanente : Versionner les fichiers générés (RECOMMANDÉ)**

```bash
# 1. Sur la machine de développement (avec Flutter)
cd /chemin/vers/airbar_backend

# 2. Vérifier le .gitignore à la racine du workspace
cat .gitignore | grep generated

# 3. Si la ligne "**/generated/" est présente, LA SUPPRIMER
nano .gitignore
# Commenter ou supprimer la ligne : **/generated/

# 4. Générer les fichiers (nécessite Flutter)
serverpod generate

# 5. Vérifier que les fichiers sont créés
ls airbar_backend_server/lib/src/generated/

# Attendu :
# endpoints.dart
# protocol.dart
# protocol.yaml
# + sous-dossiers (auth/, shop/, etc.)

# 6. Ajouter au Git
git add airbar_backend_server/lib/src/generated/
git add airbar_backend_client/lib/src/protocol/
git status

# 7. Commit et push
git commit -m "chore: version generated files for Docker deployment"
git push origin prod

# 8. Sur le serveur de production, récupérer les fichiers
git pull origin prod
docker compose up -d --build
```

**Solution alternative : Modifier le Dockerfile (NON RECOMMANDÉ)**

Utiliser une image Flutter dans le Dockerfile (image ~2GB vs 200MB) :

```dockerfile
# ⚠️ Non recommandé : build très lent et image lourde
FROM ghcr.io/cirruslabs/flutter:3.24.0 AS build
# ... reste du Dockerfile
```

---

### ❌ Erreur : "No such file or directory: 'lib/src/generated/endpoints.dart'"

**Symptôme complet :**
```
lib/server.dart:9:8: Error: Error when reading 'lib/src/generated/endpoints.dart': No such file or directory
import 'src/generated/endpoints.dart';
       ^
```

**Cause :** Les fichiers générés ne sont pas présents dans le code source.

**Voir solution ci-dessus** : [Failed to run serverpod](#-erreur--failed-to-run-serverpod-you-need-to-have-flutter-installed)

---

## 🗄️ Problèmes de base de données

### ❌ Erreur : "relation does not exist"

**Symptôme :**
```
ERROR: relation "serverpod_user_info" does not exist
ERROR: relation "users" does not exist
```

**Cause :** Les migrations n'ont pas été appliquées.

**Solution :**
```bash
# Appliquer les migrations
docker compose run --rm --entrypoint /bin/sh airbar_server \
  -c "./server --mode=production --server-id=prod-001 --logging=normal --role=monolith --apply-migrations"

# Vérifier les logs
docker compose logs airbar_server | grep -i migration

# Attendu :
# ✓ Migration 20260303162143579 applied successfully
# [...]
# All migrations applied successfully

# Redémarrer le serveur
docker compose restart airbar_server
```

---

### ❌ Erreur : "could not connect to server: Connection refused"

**Symptôme :**
```
ERROR: Failed to connect to the database.
ERROR: could not connect to server: Connection refused
Is the server running on host "postgres" (172.x.x.x) and accepting TCP/IP connections on port 5432?
```

**Cause :** PostgreSQL n'est pas démarré ou n'est pas healthy.

**Diagnostic :**
```bash
# Vérifier l'état de PostgreSQL
docker compose ps postgres

# Voir les logs PostgreSQL
docker compose logs postgres
```

**Solution :**
```bash
# 1. Redémarrer PostgreSQL
docker compose restart postgres

# 2. Attendre qu'il soit healthy (15-20 secondes)
watch -n 2 docker compose ps  # Linux
# Ou manuellement : docker compose ps (plusieurs fois)

# 3. Si toujours "unhealthy", voir les logs d'erreur
docker compose logs --tail 100 postgres

# 4. Si problème de volume, réinitialiser
docker compose down
docker volume rm airbar_backend_server_postgres_data
docker compose up -d
```

---

## 🌐 Problèmes réseau

### ❌ Erreur : "bind: address already in use"

**Symptôme :**
```
Error response from daemon: driver failed programming external connectivity on endpoint airbar_backend_prod: 
Bind for 0.0.0.0:8080 failed: port is already allocated
```

**Cause :** Un autre processus utilise déjà le port 8080/8081/8082.

**Diagnostic (Linux) :**
```bash
# Trouver le processus qui utilise le port
sudo lsof -i :8080
sudo netstat -tulpn | grep 8080
```

**Diagnostic (Windows) :**
```powershell
# Trouver le processus qui utilise le port
netstat -ano | findstr :8080
```

**Solution :**

**Option 1 : Arrêter le processus conflictuel**
```bash
# Linux
sudo kill -9 <PID>

# Windows (PowerShell en admin)
Stop-Process -Id <PID> -Force
```

**Option 2 : Modifier les ports dans docker-compose.yaml**
```yaml
services:
  airbar_server:
    ports:
      - "9080:8080"  # Au lieu de 8080:8080
      - "9081:8081"
      - "9082:8082"
```

---

### ❌ Impossible d'accéder à l'API depuis l'extérieur

**Symptôme :** `curl http://IP-SERVEUR:8080/` timeout ou connexion refusée.

**Diagnostic :**
```bash
# 1. Vérifier que le serveur écoute bien
docker compose ps
docker compose logs airbar_server | grep "listening on port"

# 2. Vérifier depuis le serveur local
curl http://localhost:8080/
# Doit répondre : {"status":"ok",...}

# 3. Vérifier le pare-feu (Linux)
sudo ufw status
sudo iptables -L -n | grep 8080
```

**Solution :**
```bash
# Ouvrir les ports dans le pare-feu
sudo ufw allow 8080/tcp
sudo ufw allow 8081/tcp
sudo ufw allow 8082/tcp
sudo ufw reload

# Vérifier
sudo ufw status numbered
```

---

## 🔬 Diagnostics avancés

### Vérification complète de l'état du système

```bash
#!/bin/bash
# Script de diagnostic complet

echo "=== ÉTAT DES SERVICES ==="
docker compose ps

echo -e "\n=== SANTÉ DES CONTENEURS ==="
docker compose ps --format json | grep -i health

echo -e "\n=== LOGS RÉCENTS SERVEUR ==="
docker compose logs --tail 20 airbar_server

echo -e "\n=== LOGS RÉCENTS POSTGRES ==="
docker compose logs --tail 20 postgres

echo -e "\n=== LOGS RÉCENTS REDIS ==="
docker compose logs --tail 5 redis

echo -e "\n=== RÉSEAU ==="
docker network ls | grep airbar
docker network inspect airbar_backend_server_airbar_network | grep -A 5 Containers

echo -e "\n=== VOLUMES ==="
docker volume ls | grep airbar

echo -e "\n=== UTILISATION RESSOURCES ==="
docker stats --no-stream --format "table {{.Container}}\t{{.CPUPerc}}\t{{.MemUsage}}"

echo -e "\n=== TEST CONNEXION POSTGRES ==="
docker compose exec postgres pg_isready -U postgres

echo -e "\n=== TEST CONNEXION REDIS ==="
docker compose exec redis redis-cli ping

echo -e "\n=== CONFIGURATION .ENV ==="
cat .env | grep -v "^#" | grep "PASSWORD" | sed 's/=.*/=***/'

echo -e "\n=== FICHIERS GÉNÉRÉS ==="
ls -lh lib/src/generated/ | head -10
```

Sauvegarder ce script dans `diagnostics.sh`, puis :
```bash
chmod +x diagnostics.sh
./diagnostics.sh > diagnostic_$(date +%Y%m%d_%H%M%S).log
```

---

### Accès au shell d'un conteneur

```bash
# Shell dans le conteneur serveur
docker compose exec airbar_server /bin/sh

# Shell dans PostgreSQL
docker compose exec postgres bash

# Shell dans Redis
docker compose exec redis sh
```

---

### Examiner les variables d'environnement

```bash
# Variables du serveur AirBar
docker compose exec airbar_server env | sort

# Variables PostgreSQL
docker compose exec postgres env | grep POSTGRES

# Variables Redis
docker compose exec redis env | grep REDIS
```

---

### Vérifier l'intégrité des fichiers de configuration

```bash
# Vérifier que production.yaml est bien lu
docker compose exec airbar_server cat config/production.yaml

# Vérifier que passwords.yaml existe
docker compose exec airbar_server cat config/passwords.yaml

# Vérifier les migrations disponibles
docker compose exec airbar_server ls migrations/
```

---

## 📝 Logs et traces

### Activer les logs verbeux

Éditer `config/production.yaml` :

```yaml
sessionLogs:
  consoleEnabled: true
  persistentEnabled: true
consoleLogFormat: json  # ou "text" pour plus de lisibilité
```

Puis redémarrer :
```bash
docker compose restart airbar_server
```

---

### Exporter les logs pour analyse

```bash
# Tous les logs depuis le début
docker compose logs > full_logs_$(date +%Y%m%d).txt

# Logs du serveur uniquement (dernières 1000 lignes)
docker compose logs --tail 1000 airbar_server > server_logs_$(date +%Y%m%d).txt

# Logs avec horodatage
docker compose logs -t > timestamped_logs_$(date +%Y%m%d).txt
```

---

## 🆘 Quand tout échoue : Reset complet

**⚠️ ATTENTION : Supprime toutes les données !**

```bash
# 1. Arrêter tous les services
docker compose down

# 2. Supprimer TOUS les volumes (BDD incluse)
docker volume rm airbar_backend_server_postgres_data
docker volume rm airbar_backend_server_redis_data

# 3. Nettoyer complètement Docker
docker system prune -a --volumes
# Confirmer avec "y"

# 4. Vérifier .env et passwords.yaml
cat .env | grep POSTGRES_PASSWORD
cat config/passwords.yaml | grep -A 1 "production:" | grep database
# DOIVENT CORRESPONDRE !

# 5. Vérifier que les fichiers générés existent
ls lib/src/generated/endpoints.dart
ls lib/src/generated/protocol.dart

# 6. Redéployer depuis zéro
docker compose up -d --build

# 7. Attendre que PostgreSQL soit healthy
sleep 20
docker compose ps

# 8. Appliquer les migrations
docker compose run --rm --entrypoint /bin/sh airbar_server \
  -c "./server --mode=production --server-id=prod-001 --logging=normal --role=monolith --apply-migrations"

# 9. Démarrer le serveur
docker compose up -d airbar_server

# 10. Vérifier
docker compose logs -f
```

---

## 📞 Obtenir de l'aide

Si aucune solution ne fonctionne :

1. **Générer un rapport de diagnostic complet** (voir section "Diagnostics avancés")
2. **Vérifier les issues GitHub** : https://github.com/rorophil/airbar_backend/issues
3. **Créer une nouvelle issue** avec :
   - OS et version (Windows 10/11, Ubuntu 22.04, etc.)
   - Versions Docker et Docker Compose
   - Logs complets (masquer les mots de passe !)
   - Étapes pour reproduire le problème

---

**Dernière mise à jour :** 2026-08-16
