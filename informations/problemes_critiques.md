# AirBar Backend - Les 3 Problèmes Critiques et Leurs Solutions
## Guide de Résolution Rapide

**🎯 Ce document résout 95% des problèmes de déploiement**

---

## ❌ Problème #1 : "password authentication failed for user postgres"

### Symptôme

```
ERROR: Failed to connect to the database.
ERROR: Severity.fatal 28P01: password authentication failed for user "postgres"
```

### Cause

**Le mot de passe dans `.env` ne correspond PAS au mot de passe dans PostgreSQL.**

PostgreSQL a été créé avec un mot de passe (souvent `1234` par défaut), mais le serveur essaie de se connecter avec un autre mot de passe défini dans `.env`.

### Solution Rapide (RECOMMANDÉE)

**⚠️ Supprime toutes les données PostgreSQL - OK pour premier déploiement**

#### Linux/macOS

```bash
# 1. Arrêter les services
docker compose down

# 2. Supprimer le volume PostgreSQL
docker volume rm airbar_backend_server_postgres_data

# 3. Vérifier la correspondance des mots de passe
echo "=== Mot de passe dans .env ==="
cat .env | grep POSTGRES_PASSWORD

echo "=== Mot de passe dans passwords.yaml ==="
cat config/passwords.yaml | grep -A 1 "production:" | grep database

# 4. Si différents, corriger .env
nano .env
# Mettre POSTGRES_PASSWORD = valeur de "database:" dans passwords.yaml

# 5. Redémarrer (PostgreSQL sera recréé avec le bon mot de passe)
docker compose up -d

# 6. Attendre 15 secondes
sleep 15

# 7. Vérifier
docker compose ps
# postgres doit être "Up (healthy)"

# 8. Appliquer les migrations
docker compose run --rm --entrypoint /bin/sh airbar_server \
  -c "./server --mode=production --apply-migrations"
```

#### Windows (PowerShell)

```powershell
# 1. Arrêter les services
docker compose down

# 2. Supprimer le volume PostgreSQL
docker volume rm airbar_backend_server_postgres_data

# 3. Vérifier la correspondance des mots de passe
Write-Host "=== Mot de passe dans .env ===" -ForegroundColor Yellow
Get-Content .env | Select-String "POSTGRES_PASSWORD"

Write-Host "=== Mot de passe dans passwords.yaml ===" -ForegroundColor Yellow
Get-Content config\passwords.yaml | Select-String -Pattern "production:" -Context 0,1

# 4. Si différents, corriger .env
notepad .env
# Mettre POSTGRES_PASSWORD = valeur de "database:" dans passwords.yaml

# 5. Redémarrer
docker compose up -d

# 6. Attendre 15 secondes
Start-Sleep -Seconds 15

# 7. Vérifier
docker compose ps

# 8. Appliquer les migrations
docker compose run --rm --entrypoint /bin/sh airbar_server `
  -c "./server --mode=production --apply-migrations"
```

### Vérification Finale

```bash
# Le mot de passe dans .env
cat .env | grep POSTGRES_PASSWORD
# DOIT être identique à

# Le mot de passe dans passwords.yaml (section production)
cat config/passwords.yaml | grep -A 8 "production:" | grep database
```

**Exemple de correspondance correcte :**

`.env` :
```
POSTGRES_PASSWORD=-g4x7Ke0FV68yDNSi1xDQpirxejC2580
```

`config/passwords.yaml` :
```yaml
production:
  database: '-g4x7Ke0FV68yDNSi1xDQpirxejC2580'
```

---

## ❌ Problème #2 : "No such file or directory: 'lib/src/generated/endpoints.dart'"

### Symptôme

```
lib/server.dart:9:8: Error: Error when reading 'lib/src/generated/endpoints.dart': 
No such file or directory
```

Ou pendant le build Docker :

```
=> ERROR [airbar_server build 7/7] RUN dart compile exe bin/main.dart -o bin/server
lib/src/generated/endpoints.dart: No such file or directory
```

### Cause

**Les fichiers générés par Serverpod ne sont pas présents dans le code source.**

Serverpod génère automatiquement du code (`endpoints.dart`, `protocol.dart`), mais la génération nécessite Flutter. Pour déployer avec Docker (image Dart légère), ces fichiers doivent être versionnés dans Git.

### Solution

#### Étape 1 : Vérifier que les fichiers existent localement

```bash
# Linux/macOS
ls lib/src/generated/endpoints.dart
ls lib/src/generated/protocol.dart

# Windows
dir lib\src\generated\endpoints.dart
dir lib\src\generated\protocol.dart
```

**Si les fichiers n'existent pas :**

```bash
# Sur une machine de développement avec Flutter installé
cd /chemin/vers/airbar_backend
serverpod generate

# Vérifier
ls airbar_backend_server/lib/src/generated/
```

#### Étape 2 : Vérifier le .gitignore

```bash
# À la RACINE du workspace (pas dans airbar_backend_server)
cd /chemin/vers/airbar_backend
cat .gitignore | grep generated
```

**La ligne `**/generated/` NE DOIT PAS être présente.**

Si elle existe :

```bash
# Éditer .gitignore
nano .gitignore  # Linux/macOS
notepad .gitignore  # Windows

# Supprimer ou commenter la ligne :
# **/generated/
```

#### Étape 3 : Versionner les fichiers générés

```bash
# Ajouter les fichiers générés au Git
git add airbar_backend_server/lib/src/generated/
git add airbar_backend_client/lib/src/protocol/

# Vérifier ce qui va être commité
git status

# Commit
git commit -m "chore: version generated files for Docker deployment"

# Push
git push origin prod
```

#### Étape 4 : Sur le serveur de production

```bash
# Récupérer les nouveaux fichiers
git pull origin prod

# Rebuild
docker compose down
docker compose up -d --build
```

### Vérification Finale

```bash
# Ces 3 fichiers DOIVENT exister
ls lib/src/generated/endpoints.dart
ls lib/src/generated/protocol.dart
ls lib/src/generated/protocol.yaml

# Et ne DOIVENT PAS être dans .gitignore
git check-ignore lib/src/generated/endpoints.dart
# Doit afficher : (rien) ou erreur "not ignored"
```

---

## ❌ Problème #3 : "Failed to run serverpod. You need to have flutter installed"

### Symptôme

```
=> ERROR [airbar_server build 9/10] RUN dart pub global run serverpod_cli generate
ERROR: Failed to run serverpod. You need to have flutter installed and in your $PATH
```

### Cause

**Le Dockerfile essaie de générer le code Serverpod dans Docker, mais Flutter n'est pas installé dans l'image Dart.**

Cela arrive si une ancienne version du Dockerfile contenait :
```dockerfile
RUN dart pub global activate serverpod_cli
RUN dart pub global run serverpod_cli generate
```

### Solution

**Les fichiers générés doivent déjà être présents** (voir Problème #2).

Vérifier que votre `Dockerfile` contient :

```dockerfile
# Build stage
FROM dart:3.8.0 AS build
WORKDIR /app

# Build from the server package (generated files are already included in source)
COPY airbar_backend_server ./airbar_backend_server
RUN printf "name: _\npublish_to: none\nenvironment:\n  sdk: '^3.8.0'\nworkspace:\n  - airbar_backend_server\n" > /app/pubspec.yaml
WORKDIR /app/airbar_backend_server

# Install dependencies
RUN dart pub get

# Note: Generated files are already copied with the source code
# No need to regenerate them (would require Flutter)

# Compile the server executable
RUN dart compile exe bin/main.dart -o bin/server
```

**⚠️ Le Dockerfile NE DOIT PAS contenir :**
```dockerfile
RUN dart pub global activate serverpod_cli
RUN dart pub global run serverpod_cli generate
```

Si votre Dockerfile contient ces lignes, supprimez-les et assurez-vous que les fichiers générés sont versionnés (voir Problème #2).

---

## 🔍 Diagnostic Automatique

**Utilisez les scripts de diagnostic pour identifier automatiquement les problèmes :**

### Linux/macOS

```bash
cd airbar_backend_server
chmod +x diagnostic.sh
./diagnostic.sh
```

### Windows (PowerShell)

```powershell
cd airbar_backend_server
.\diagnostic.ps1
```

Le script génère un rapport complet et identifie automatiquement les 3 problèmes ci-dessus.

---

## ✅ Checklist Complète de Déploiement

Avant de déployer, vérifiez ces points :

- [ ] **Fichiers générés** : `lib/src/generated/endpoints.dart` et `protocol.dart` existent
- [ ] **Git** : Les fichiers générés sont versionnés (pas dans `.gitignore`)
- [ ] **Mots de passe** : `POSTGRES_PASSWORD` dans `.env` = `database:` dans `passwords.yaml` (section `production:`)
- [ ] **Dockerfile** : Ne contient PAS de génération de code (pas de `serverpod_cli generate`)
- [ ] **Docker** : Docker Desktop démarré (Windows) ou daemon actif (Linux)
- [ ] **Ports** : 8080, 8081, 8082 disponibles (pas déjà utilisés)

### Commandes de vérification rapide

```bash
# 1. Vérifier fichiers générés
ls lib/src/generated/{endpoints,protocol}.dart

# 2. Vérifier correspondance mots de passe
echo "=== .env ==="; cat .env | grep POSTGRES_PASSWORD
echo "=== passwords.yaml ==="; cat config/passwords.yaml | grep -A 1 "production:" | grep database

# 3. Vérifier Dockerfile
cat Dockerfile | grep "serverpod_cli generate"
# Doit afficher : (rien)

# 4. Vérifier Docker
docker --version
docker compose version

# 5. Vérifier ports
netstat -tuln | grep -E ':(8080|8081|8082)'  # Linux
netstat -ano | findstr ":808"  # Windows
```

---

## 📚 Pour aller plus loin

- **Guide complet** : [installation_serveur_production.md](installation_serveur_production.md)
- **Dépannage exhaustif** : [troubleshooting.md](troubleshooting.md)
- **Installation rapide** : [installation_quickstart.md](installation_quickstart.md)

---

**Dernière mise à jour :** 2026-08-16
