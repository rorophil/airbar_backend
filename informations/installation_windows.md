# Guide d'installation Windows vierge -> serveur AirBar operationnel

Ce document explique l'installation complete sur un Windows neuf, sans outils preinstalles.

## 1. Prerequis machine

- Windows 10/11 64 bits
- Droits administrateur
- Internet
- Recommande: 8 Go RAM minimum, 20 Go disque libre

## 2. Installer les outils systeme

### 2.1 Installer Git

1. Telecharger: https://git-scm.com/download/win
2. Installer avec les options par defaut.
3. Ouvrir un nouveau PowerShell et verifier:

```powershell
git --version
```

### 2.2 Installer Docker Desktop

1. Telecharger: https://www.docker.com/products/docker-desktop/
2. Installer Docker Desktop.
3. Pendant l'installation, laisser WSL2 active (recommande).
4. Redemarrer Windows si demande.
5. Lancer Docker Desktop et attendre que le moteur soit "Running".
6. Verifier:

```powershell
docker --version
docker compose version
```

Si `docker compose` n'est pas reconnu, fermer/reouvrir le terminal apres lancement de Docker Desktop.

## 3. Recuperer le projet

Dans PowerShell:

```powershell
cd C:\
mkdir airbar_production
cd airbar_production
git clone https://github.com/rorophil/airbar_backend.git
cd .\airbar_backend\airbar_backend_server
```

Verifier la presence des fichiers:

```powershell
dir
```

Vous devez avoir notamment:

- `docker-compose.yaml`
- `Dockerfile`
- `config\production.yaml`
- `.env`

## 4. Configurer les secrets (`.env`)

Le serveur lit les secrets depuis `.env` et les variables d'environnement Docker.

Ouvrir `.env` et verifier qu'au minimum ces variables existent:

```env
POSTGRES_PASSWORD=ChangeMePostgresPassword
REDIS_PASSWORD=ChangeMeRedisPassword
SERVERPOD_PASSWORD_SHARED=ChangeMeSharedKeyAtLeast32Chars
SERVERPOD_PASSWORD_SERVICE_SECRET=ChangeMeServiceSecretAtLeast32Chars
SERVERPOD_PASSWORD_JWT_REFRESH_PEPPER=ChangeMeJwtRefreshPepperAtLeast32Chars
SERVERPOD_PASSWORD_JWT_HMAC_SHA512_PRIVATE_KEY=ChangeMeJwtHmacSha512PrivateKeyAtLeast32Chars
SERVERPOD_PASSWORD_EMAIL_SECRET_HASH_PEPPER=ChangeMeEmailSecretHashPepperAtLeast32Chars
```

Important:

- Utiliser des valeurs fortes (minimum 32 caracteres aleatoires) en production.
- Ne pas commiter `.env` dans Git.

## 5. Verifier la config production

Dans `config\production.yaml`, verifier au minimum:

- `apiServer.publicHost` est defini (ex: `localhost` en local, domaine en prod).
- `database.host` = `postgres`
- `redis.host` = `redis`

## 6. Construire et demarrer la stack

Depuis `C:\airbar_production\airbar_backend\airbar_backend_server`:

```powershell
docker compose -f .\docker-compose.yaml up -d --build
```

Cette commande:

- build l'image backend
- demarre postgres, redis, et le serveur

Verifier l'etat:

```powershell
docker compose -f .\docker-compose.yaml ps
```

Attendu:

- `postgres` -> `Up (healthy)`
- `redis` -> `Up (healthy)`
- `airbar_server` -> `Up`

## 7. Appliquer les migrations de base (obligatoire au premier lancement)

Si la base est vide, appliquer les migrations:

```powershell
docker compose -f .\docker-compose.yaml run --rm airbar_server --apply-migrations
```

Puis redemarrer le serveur:

```powershell
docker compose -f .\docker-compose.yaml up -d airbar_server
```

## 8. Verifier les logs

```powershell
docker compose -f .\docker-compose.yaml logs --tail 100 airbar_server
```

Si tout est correct, vous devez voir l'initialisation Serverpod sans boucle de restart.

## 9. Commandes d'exploitation utiles

Redemarrer tout:

```powershell
docker compose -f .\docker-compose.yaml restart
```

Arreter:

```powershell
docker compose -f .\docker-compose.yaml down
```

Arreter + supprimer aussi les volumes (destructif):

```powershell
docker compose -f .\docker-compose.yaml down -v
```

## 10. Depannage rapide

### `docker` ou `docker compose` non reconnu

- Verifier Docker Desktop lance.
- Fermer/reouvrir PowerShell.
- Verifier `docker compose version`.

### Erreur "Missing password for ..."

- Verifier les variables `SERVERPOD_PASSWORD_*` dans `.env`.
- Reappliquer:

```powershell
docker compose -f .\docker-compose.yaml up -d --build
```

### Erreur "relation ... does not exist"

- Les migrations ne sont pas appliquees.
- Lancer:

```powershell
docker compose -f .\docker-compose.yaml run --rm airbar_server --apply-migrations
```

### Le conteneur backend redemarre en boucle

1. Lire les logs:

```powershell
docker compose -f .\docker-compose.yaml logs --tail 200 airbar_server
```

2. Corriger la cause (secret manquant, config invalide, migrations non appliquees).
3. Redemarrer:

```powershell
docker compose -f .\docker-compose.yaml up -d airbar_server
```

## 11. Check-list finale

- Docker Desktop actif
- `.env` complete avec secrets forts
- `docker compose ps` OK (postgres/redis healthy, backend Up)
- migrations appliquees
- logs backend sans crash

