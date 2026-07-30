# AirBar Server - Quickstart Windows (machine vierge)

Objectif: installer et demarrer rapidement le serveur avec Docker.

## 1) Installer les outils

1. Installer Git: https://git-scm.com/download/win
2. Installer Docker Desktop: https://www.docker.com/products/docker-desktop/
3. Ouvrir Docker Desktop et attendre l'etat Running.

Verification:

```powershell
git --version
docker --version
docker compose version
```

## 2) Recuperer le projet

```powershell
cd C:\
mkdir airbar_production
cd airbar_production
git clone https://github.com/rorophil/airbar_backend.git
cd .\airbar_backend\airbar_backend_server
```

## 3) Configurer les secrets

Ouvrir `.env` et mettre des valeurs fortes:

```env
POSTGRES_PASSWORD=ChangeMePostgresPassword
REDIS_PASSWORD=ChangeMeRedisPassword
SERVERPOD_PASSWORD_SHARED=ChangeMeSharedKeyAtLeast32Chars
SERVERPOD_PASSWORD_SERVICE_SECRET=ChangeMeServiceSecretAtLeast32Chars
SERVERPOD_PASSWORD_JWT_REFRESH_PEPPER=ChangeMeJwtRefreshPepperAtLeast32Chars
SERVERPOD_PASSWORD_JWT_HMAC_SHA512_PRIVATE_KEY=ChangeMeJwtHmacSha512PrivateKeyAtLeast32Chars
SERVERPOD_PASSWORD_EMAIL_SECRET_HASH_PEPPER=ChangeMeEmailSecretHashPepperAtLeast32Chars
```

## 4) Build + demarrage

```powershell
docker compose -f .\docker-compose.yaml up -d --build
docker compose -f .\docker-compose.yaml ps
```

Attendu: postgres et redis en healthy, backend en Up.

## 5) Appliquer les migrations (premier demarrage)

```powershell
docker compose -f .\docker-compose.yaml run --rm --entrypoint /bin/sh airbar_server -c "./server --mode=production --server-id=prod-001 --logging=normal --role=monolith --apply-migrations"
docker compose -f .\docker-compose.yaml up -d airbar_server
```

## 6) Verifier les logs

```powershell
docker compose -f .\docker-compose.yaml logs --tail 100 airbar_server
```

## 7) Commandes utiles

Redemarrer:

```powershell
docker compose -f .\docker-compose.yaml restart
```

Arreter:

```powershell
docker compose -f .\docker-compose.yaml down
```

Reset complet (supprime les volumes, destructif):

```powershell
docker compose -f .\docker-compose.yaml down -v
```

## 8) Si probleme

- docker compose non reconnu: relancer Docker Desktop puis reouvrir PowerShell.
- Missing password for ...: verifier toutes les variables SERVERPOD_PASSWORD_* dans .env.
- relation ... does not exist: relancer la commande d'application des migrations en mode production.
- backend en boucle de restart: lire les logs:

```powershell
docker compose -f .\docker-compose.yaml logs --tail 200 airbar_server
```
