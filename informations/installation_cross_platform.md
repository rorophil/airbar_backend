# Guide d installation AirBar Server (Windows, macOS, Linux)

Objectif: deployer et lancer le serveur AirBar avec Docker Compose sur les 3 OS.

## 1. Prerequis communs

- Acces administrateur (ou sudo sur Linux/macOS)
- Connexion Internet
- Docker Desktop (Windows/macOS) ou Docker Engine + Compose plugin (Linux)
- Git

Verification rapide:

### Windows (PowerShell)

```powershell
git --version
docker --version
docker compose version
```

### macOS / Linux (bash)

```bash
git --version
docker --version
docker compose version
```

## 2. Installer les outils

### Windows

1. Installer Git: https://git-scm.com/download/win
2. Installer Docker Desktop: https://www.docker.com/products/docker-desktop/
3. Ouvrir Docker Desktop et attendre Running.

### macOS

1. Installer Git (souvent deja present):
   - `xcode-select --install` si necessaire
2. Installer Docker Desktop: https://www.docker.com/products/docker-desktop/
3. Lancer Docker Desktop et attendre Running.

### Linux (Ubuntu/Debian)

```bash
sudo apt update
sudo apt install -y ca-certificates curl gnupg git

# Docker Engine + Compose plugin
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo $VERSION_CODENAME) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Optionnel: eviter sudo pour docker
sudo usermod -aG docker $USER
# puis deconnecter/reconnecter la session
```

## 3. Recuperer le code

### Windows (PowerShell)

```powershell
cd C:\
mkdir airbar_production
cd airbar_production
git clone https://github.com/rorophil/airbar_backend.git
cd .\airbar_backend\airbar_backend_server
```

### macOS / Linux (bash)

```bash
mkdir -p ~/airbar_production
cd ~/airbar_production
git clone https://github.com/rorophil/airbar_backend.git
cd airbar_backend/airbar_backend_server
```

## 4. Configurer les secrets (.env)

Dans le dossier `airbar_backend_server`, verifier/editer `.env`:

```env
POSTGRES_PASSWORD=ChangeMePostgresPassword
REDIS_PASSWORD=ChangeMeRedisPassword
SERVERPOD_PASSWORD_SHARED=ChangeMeSharedKeyAtLeast32Chars
SERVERPOD_PASSWORD_SERVICE_SECRET=ChangeMeServiceSecretAtLeast32Chars
SERVERPOD_PASSWORD_JWT_REFRESH_PEPPER=ChangeMeJwtRefreshPepperAtLeast32Chars
SERVERPOD_PASSWORD_JWT_HMAC_SHA512_PRIVATE_KEY=ChangeMeJwtHmacSha512PrivateKeyAtLeast32Chars
SERVERPOD_PASSWORD_EMAIL_SECRET_HASH_PEPPER=ChangeMeEmailSecretHashPepperAtLeast32Chars
```

Recommandation: utiliser des valeurs aleatoires de 32+ caracteres en production.

## 5. Verifier la config production

Verifier `config/production.yaml`:

- `apiServer.publicHost` doit exister
- `database.host` doit etre `postgres`
- `redis.host` doit etre `redis`

## 6. Build et demarrage

### Windows (PowerShell)

```powershell
docker compose -f .\docker-compose.yaml up -d --build
docker compose -f .\docker-compose.yaml ps
```

### macOS / Linux (bash)

```bash
docker compose -f ./docker-compose.yaml up -d --build
docker compose -f ./docker-compose.yaml ps
```

Attendu:

- postgres: Up (healthy)
- redis: Up (healthy)
- airbar_server: Up

## 7. Premier demarrage: appliquer les migrations

### Windows (PowerShell)

```powershell
docker compose -f .\docker-compose.yaml run --rm airbar_server --apply-migrations
docker compose -f .\docker-compose.yaml up -d airbar_server
```

### macOS / Linux (bash)

```bash
docker compose -f ./docker-compose.yaml run --rm airbar_server --apply-migrations
docker compose -f ./docker-compose.yaml up -d airbar_server
```

## 8. Verifier les logs

### Windows (PowerShell)

```powershell
docker compose -f .\docker-compose.yaml logs --tail 100 airbar_server
```

### macOS / Linux (bash)

```bash
docker compose -f ./docker-compose.yaml logs --tail 100 airbar_server
```

## 9. Operations courantes

### Redemarrer

Windows:

```powershell
docker compose -f .\docker-compose.yaml restart
```

macOS/Linux:

```bash
docker compose -f ./docker-compose.yaml restart
```

### Arreter

Windows:

```powershell
docker compose -f .\docker-compose.yaml down
```

macOS/Linux:

```bash
docker compose -f ./docker-compose.yaml down
```

### Reset complet (destructif, supprime les volumes)

Windows:

```powershell
docker compose -f .\docker-compose.yaml down -v
```

macOS/Linux:

```bash
docker compose -f ./docker-compose.yaml down -v
```

## 10. Depannage rapide

### docker compose non reconnu

- Windows/macOS: verifier Docker Desktop lance
- Linux: verifier installation du compose plugin

```bash
docker compose version
```

### Missing password for ...

- verifier toutes les variables `SERVERPOD_PASSWORD_*` dans `.env`
- relancer build + up

### relation ... does not exist

- migrations non appliquees
- relancer `--apply-migrations`

### backend en restart loop

- inspecter logs backend

Windows:

```powershell
docker compose -f .\docker-compose.yaml logs --tail 200 airbar_server
```

macOS/Linux:

```bash
docker compose -f ./docker-compose.yaml logs --tail 200 airbar_server
```

## 11. Checklist finale

- Docker OK
- .env complet et securise
- postgres/redis healthy
- backend Up
- migrations appliquees
- logs sans crash

## 12. Mode express (10 commandes max)

Utiliser cette section si vous voulez aller au plus court.

### Windows (PowerShell)

```powershell
cd C:\
mkdir airbar_production
cd airbar_production
git clone https://github.com/rorophil/airbar_backend.git
cd .\airbar_backend\airbar_backend_server
docker compose -f .\docker-compose.yaml up -d --build
docker compose -f .\docker-compose.yaml run --rm airbar_server --apply-migrations
docker compose -f .\docker-compose.yaml up -d airbar_server
docker compose -f .\docker-compose.yaml ps
docker compose -f .\docker-compose.yaml logs --tail 100 airbar_server
```

### macOS / Linux (bash)

```bash
mkdir -p ~/airbar_production
cd ~/airbar_production
git clone https://github.com/rorophil/airbar_backend.git
cd airbar_backend/airbar_backend_server
docker compose -f ./docker-compose.yaml up -d --build
docker compose -f ./docker-compose.yaml run --rm airbar_server --apply-migrations
docker compose -f ./docker-compose.yaml up -d airbar_server
docker compose -f ./docker-compose.yaml ps
docker compose -f ./docker-compose.yaml logs --tail 100 airbar_server
```
