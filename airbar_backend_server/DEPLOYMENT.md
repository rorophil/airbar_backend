cat

# Guide de Déploiement - AirBar Backend Production

## 🚀 Déploiement Initial sur Serveur Distant

### Prérequis

- Docker et Docker Compose installés
- Accès SSH au serveur
- Git configuré

### Étapes de déploiement

#### 1. Cloner le dépôt sur le serveur

```bash
cd ~/
git clone <votre-repo-git> airbarserver
cd airbarserver/airbar_backend/airbar_backend_server
```

#### 2. Créer le fichier .env

```bash
# Copier l'exemple
cp .env.example .env

# Éditer avec vos vrais mots de passe
nano .env
```

**IMPORTANT** : Les mots de passe dans `.env` **DOIVENT** correspondre à ceux dans `config/passwords.yaml` section `production` :

| Variable .env                                      | Clé passwords.yaml           | Valeur actuelle                      |
| -------------------------------------------------- | ----------------------------- | ------------------------------------ |
| `POSTGRES_PASSWORD`                              | `database`                  | `-g4x7Ke0FV68yDNSi1xDQpirxejC2580` |
| `SERVERPOD_PASSWORD_SHARED`                      | `serviceSecret`             | `k7N45MLCfD2PNbl_IvKc2bYwqn9FM05i` |
| `SERVERPOD_PASSWORD_JWT_REFRESH_PEPPER`          | `jwtRefreshTokenHashPepper` | `XlrfjPF3mW_lfHT355US_dpcVLxgStfc` |
| `SERVERPOD_PASSWORD_JWT_HMAC_SHA512_PRIVATE_KEY` | `jwtHmacSha512PrivateKey`   | `QjjCRgRcEwJcjwH2sjbxF9n24TLvIpYL` |
| `SERVERPOD_PASSWORD_EMAIL_SECRET_HASH_PEPPER`    | `emailSecretHashPepper`     | `9j7p2HCkJevye1Eo8GndwhKSaw7X2SKd` |

#### 3. Sécuriser le fichier .env

```bash
chmod 600 .env
```

#### 4. Lancer les services

```bash
# Build et démarrage
docker compose -f ./docker-compose.yaml up -d --build

# Vérifier les logs
docker compose logs -f airbar_server
```

#### 5. Appliquer les migrations (première fois uniquement)

```bash
docker compose -f ./docker-compose.yaml run --rm --entrypoint /bin/sh airbar_server \
  -c "./server --mode=production --server-id=prod-001 --logging=normal --role=monolith --apply-migrations"
```

## 🔄 Mises à jour ultérieures

```bash
cd ~/airbarserver/airbar_backend/airbar_backend_server

# Pull les derniers changements
git pull

# Rebuild et redémarrage
docker compose down
docker compose up -d --build

# Vérifier les logs
docker compose logs -f airbar_server
```

## 🔍 Vérifications

### Vérifier que les services sont démarrés

```bash
docker compose ps
```

Tous les services doivent être `Up` et `healthy`.

### Tester l'API

```bash
curl http://localhost:8080/
```

### Vérifier les logs

```bash
# Logs du serveur
docker compose logs -f airbar_server

# Logs PostgreSQL
docker compose logs -f postgres

# Logs Redis
docker compose logs -f redis
```

## 🔐 Sécurité - Production

### ⚠️ AVANT LA MISE EN PRODUCTION, CHANGEZ TOUS LES MOTS DE PASSE !

1. **Générez de nouveaux mots de passe sécurisés** :

   ```bash
   # Générer un mot de passe aléatoire de 32 caractères
   openssl rand -base64 32
   ```
2. **Mettez à jour les fichiers** :

   - `config/passwords.yaml` (section `production`)
   - `.env` sur le serveur
3. **Les mots de passe DOIVENT** :

   - Faire au moins 32 caractères
   - Être uniques (différents pour chaque service)
   - Ne jamais être committés dans Git
   - Être stockés dans un gestionnaire de mots de passe sécurisé

### Fichiers sensibles à protéger

- `.env` : **JAMAIS** dans Git
- `config/passwords.yaml` : **JAMAIS** dans Git (déjà dans .gitignore)
- Permissions : `chmod 600 .env config/passwords.yaml`

## 🌐 Accès externe

Si vous voulez accéder à l'API depuis l'extérieur du serveur, configurez :

1. **Pare-feu** : Ouvrir les ports 8080, 8081, 8082
2. **Nginx reverse proxy** (recommandé pour SSL)
3. **SSL/TLS** avec Let's Encrypt

## 📊 Monitoring

```bash
# Logs en temps réel
docker compose logs -f

# Statistiques des conteneurs
docker stats

# Espace disque utilisé
docker system df
```

## 🛑 Arrêt des services

```bash
# Arrêt propre
docker compose down

# Arrêt + suppression des volumes (⚠️ PERTE DE DONNÉES)
docker compose down -v
```

## 🆘 Dépannage

### Problème : "password authentication failed"

✅ **Solution** : Vérifiez que `POSTGRES_PASSWORD` dans `.env` correspond à `database` dans `config/passwords.yaml` section `production`.

```bash
# Vérifier la valeur dans passwords.yaml
grep "database:" config/passwords.yaml

# Vérifier la valeur dans .env
grep "POSTGRES_PASSWORD" .env
```

### Problème : "Failed to connect to the database"

1. Vérifier que PostgreSQL est démarré :

   ```bash
   docker compose ps postgres
   ```
2. Vérifier les logs PostgreSQL :

   ```bash
   docker compose logs postgres
   ```
3. Tester la connexion manuellement :

   ```bash
   docker compose exec postgres psql -U postgres -d airbar_backend
   ```

### Problème : "No such file or directory" pour generated files

✅ **Solution** : Les fichiers générés doivent être versionnés dans Git. Assurez-vous que `**/generated/` n'est PAS dans `.gitignore` (à la racine du workspace).

```bash
# Vérifier si les fichiers générés sont présents
ls -la lib/src/generated/

# Si absents, générez-les en local puis commit :
serverpod generate
git add lib/src/generated/
git commit -m "chore: add generated files"
git push
```
