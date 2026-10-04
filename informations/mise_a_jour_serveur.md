# Guide de mise à jour du serveur AirBar (upgrade depuis GitHub)

**Objectif :** Récupérer une nouvelle version du code depuis le repository GitHub et la déployer sans perte de données, avec possibilité de revenir en arrière en cas de problème.

**Prérequis :** La stack tourne déjà via Docker Compose (voir `installation_serveur_production.md`).

---

## 1. Vérifier l'état actuel avant upgrade

### Windows (PowerShell)

Depuis `C:\airbar_production\airbar_backend\airbar_backend_server` :

```powershell
docker compose ps
git status
git log -1 --oneline
```

### Linux (Bash)

Depuis `~/airbar_production/airbar_backend/airbar_backend_server` :

```bash
docker compose ps
git status
git log -1 --oneline
```

**📝 Notez le commit actuel** : il servira de point de retour si l'upgrade échoue.

## 2. Sauvegarder la base de données (obligatoire)

⚠️ **Ne jamais upgrader sans backup préalable.**

### Windows (PowerShell)

Créez d'abord le dossier `backups` s'il n'existe pas encore :

```powershell
mkdir backups -ErrorAction SilentlyContinue
```

Puis effectuez le dump et copiez-le localement :

```powershell
docker exec airbar_postgres_prod pg_dump -U postgres -d airbar_backend -F c -f /tmp/airbar_backup.dump
docker cp airbar_postgres_prod:/tmp/airbar_backup.dump .\backups\airbar_backup_$(Get-Date -Format 'yyyyMMdd_HHmmss').dump
```

### Linux (Bash)

Créez le dossier `backups` :

```bash
mkdir -p backups
```

Effectuez le dump et copiez-le localement :

```bash
docker exec airbar_postgres_prod pg_dump -U postgres -d airbar_backend -F c -f /tmp/airbar_backup.dump
docker cp airbar_postgres_prod:/tmp/airbar_backup.dump ./backups/airbar_backup_$(date +%Y%m%d_%H%M%S).dump
```

## 3. Sauvegarder les fichiers locaux non versionnés

Ces fichiers ne viennent pas de Git et doivent être préservés :

- `.env`
- `config/production.yaml` (si personnalisé localement)

### Windows (PowerShell)

```powershell
copy .env .env.backup
copy config\production.yaml config\production.yaml.backup
```

### Linux (Bash)

```bash
cp .env .env.backup
cp config/production.yaml config/production.yaml.backup
```

## 4. Récupérer la nouvelle version du code

### Windows (PowerShell)

```powershell
cd C:\airbar_production\airbar_backend
git fetch origin
git status
```

Si vous avez des modifications locales non commitées et non voulues, vérifiez-les avant de continuer (`git diff`). Sinon :

```powershell
git pull origin prod
```

### Linux (Bash)

```bash
cd ~/airbar_production/airbar_backend
git fetch origin
git status
```

Si vous avez des modifications locales non commitées et non voulues, vérifiez-les avant de continuer (`git diff`). Sinon :

```bash
git pull origin prod
```

---

### 4bis. Si la nouvelle version est sur une autre branche que `prod`

Si le code à déployer se trouve sur une branche différente (ex: `release/1.2`, `hotfix-xyz`), n'utilisez pas `git pull origin prod`. Procédez ainsi :

#### Windows (PowerShell)

```powershell
cd C:\airbar_production\airbar_backend
git fetch origin
git branch -r
```

#### Linux (Bash)

```bash
cd ~/airbar_production/airbar_backend
git fetch origin
git branch -r
```

`git branch -r` liste les branches distantes disponibles pour vérifier le nom exact de la branche.

**Cas A - vous êtes déjà sur `prod` en local et voulez basculer définitivement sur la nouvelle branche :**

**Windows :**
```powershell
git checkout <nom-de-la-nouvellebranche>
git pull origin <nom-de-la-nouvellebranche>
```

**Linux :**
```bash
git checkout <nom-de-la-nouvellebranche>
git pull origin <nom-de-la-nouvellebranche>
```

**Cas B - la branche n'existe pas encore en local (première fois) :**

**Windows :**
```powershell
git checkout -b <nom-de-la-nouvellebranche> origin/<nom-de-la-nouvellebranche>
```

**Linux :**
```bash
git checkout -b <nom-de-la-nouvellebranche> origin/<nom-de-la-nouvellebranche>
```

Vérifiez ensuite que vous êtes bien sur la bonne branche et à jour :

**Windows :**
```powershell
git status
git log -1 --oneline
```

**Linux :**
```bash
git status
git log -1 --oneline
```

Le reste de la procédure (étapes 5 à 8) reste identique. Notez simplement que la commande de rollback à l'étape 9 devra recibler la branche/commit d'origine (`prod` ou celle utilisée avant l'upgrade) plutôt que systématiquement `prod`.

> 💡 **Astuce :** Si vous devez repasser sur `prod` plus tard, utilisez `git checkout prod` puis `git pull origin prod`.

## 5. Comparer les fichiers sensibles

Après le pull, vérifiez si `docker-compose.yaml`, `Dockerfile` ou `config/production.yaml` ont changé (nouvelles variables d'environnement, nouveaux secrets requis, etc.) :

**Windows et Linux :**
```bash
git log -p -3 -- airbar_backend_server/docker-compose.yaml
git log -p -3 -- airbar_backend_server/config/production.yaml
```

Si de nouvelles variables `SERVERPOD_PASSWORD_*` ont été ajoutées, complétez votre `.env`.

## 6. Reconstruire l'image et redémarrer

### Windows (PowerShell)

```powershell
cd .\airbar_backend_server
docker compose up -d --build
docker compose ps
```

### Linux (Bash)

```bash
cd airbar_backend_server
docker compose up -d --build
docker compose ps
```

## 7. Appliquer les nouvelles migrations (si présentes)

Vérifiez d'abord si de nouvelles migrations sont arrivées :

**Windows et Linux :**
```bash
git log -1 --oneline -- migrations/migration_registry.txt
```

Si oui, appliquez-les en mode production :

### Windows (PowerShell)

```powershell
docker compose run --rm --entrypoint /bin/sh airbar_server -c "./server --mode=production --server-id=prod-001 --logging=normal --role=monolith --apply-migrations"
docker compose up -d airbar_server
```

### Linux (Bash)

```bash
docker compose run --rm --entrypoint /bin/sh airbar_server -c "./server --mode=production --server-id=prod-001 --logging=normal --role=monolith --apply-migrations"
docker compose up -d airbar_server
```

## 8. Vérifier que tout fonctionne

### Logs du serveur

**Windows :**
```powershell
docker compose logs --tail 100 airbar_server
```

**Linux :**
```bash
docker compose logs --tail 100 airbar_server
```

**✅ Attendu :**
- Pas d'erreur `relation ... does not exist`
- Pas de boucle de restart
- Le serveur annonce bien `runMode: production`

### Test rapide de l'API

**Windows :**
```powershell
curl http://localhost:8080
```

**Linux :**
```bash
curl http://localhost:8080
```

## 9. En cas de problème : revenir en arrière

### Revenir au code précédent

**Windows (PowerShell) :**
```powershell
cd C:\airbar_production\airbar_backend
git checkout <commit-note-etape-1>
cd .\airbar_backend_server
docker compose up -d --build
```

**Linux (Bash) :**
```bash
cd ~/airbar_production/airbar_backend
git checkout <commit-note-etape-1>
cd airbar_backend_server
docker compose up -d --build
```

### Restaurer la base si une migration a corrompu les données

**Windows (PowerShell) :**
```powershell
docker compose stop airbar_server
docker cp .\backups\<fichier_backup>.dump airbar_postgres_prod:/tmp/restore.dump
docker exec airbar_postgres_prod pg_restore -U postgres -d airbar_backend --clean --if-exists /tmp/restore.dump
docker compose up -d airbar_server
```

**Linux (Bash) :**
```bash
docker compose stop airbar_server
docker cp ./backups/<fichier_backup>.dump airbar_postgres_prod:/tmp/restore.dump
docker exec airbar_postgres_prod pg_restore -U postgres -d airbar_backend --clean --if-exists /tmp/restore.dump
docker compose up -d airbar_server
```

---

## 10. Checklist upgrade

- [ ] Commit actuel noté (étape 1)
- [ ] Backup base de données effectué (étape 2)
- [ ] `.env` sauvegardé (étape 3)
- [ ] `git pull` effectué sans conflit (étape 4)
- [ ] Fichiers sensibles (`docker-compose.yaml`, `production.yaml`) vérifiés (étape 5)
- [ ] Image reconstruite (`--build`) (étape 6)
- [ ] Migrations appliquées si nécessaire (étape 7)
- [ ] Logs vérifiés (pas de crash) (étape 8)
- [ ] API testée et fonctionnelle (étape 8)
- [ ] Plan de rollback identifié (commit + backup) au cas où (étape 9)

---

**📝 Maintenu par :** Philippe Robert ([@rorophil](https://github.com/rorophil))  
**📅 Dernière mise à jour :** 2026-08-16
