# AirBar Backend Server (Serverpod)

Backend Serverpod pour l'application de gestion de bar d'aéro-club AirBar.

## 🚀 Démarrage Rapide

### Prérequis

- Dart 3.x
- PostgreSQL (via Docker recommandé)
- Serverpod CLI 3.3.1+

### Démarrer les services

1. **Lancer PostgreSQL avec Docker :**
   ```bash
   docker compose up --build --detach
   ```

2. **Démarrer le serveur Serverpod :**
   ```bash
   dart bin/main.dart
   ```

3. **Appliquer les migrations (première installation) :**
   ```bash
   dart bin/main.dart --apply-migrations
   ```

### Arrêter les services

```bash
# Arrêter Serverpod
Ctrl-C

# Arrêter Docker
docker compose stop
```

## 📊 Architecture

### Endpoints Principaux

- **AuthEndpoint** : Authentification PIN, gestion des sessions
- **UserEndpoint** : CRUD utilisateurs, gestion des soldes
- **ProductEndpoint** : Gestion des produits et portions
- **CategoryEndpoint** : Catégories de produits
- **CartEndpoint** : Panier d'achat
- **TransactionEndpoint** : Transactions, checkout, remboursements
- **StockEndpoint** : Réapprovisionnement, ajustements d'inventaire

### Modèles Clés

#### Product (Gestion par Unités)
```yaml
stockQuantity: int              # Unités complètes non ouvertes
minStockAlert: int              # Seuil d'alerte en unités
currentUnitRemaining: double?   # Quantité dans l'unité entamée
isBulkProduct: bool            # Produit en vrac ?
bulkUnit: String?              # "litres", "kg", etc.
bulkTotalQuantity: double?     # Capacité par unité (ex: 6L/fût)
```

#### Gestion du Stock
Le système gère les produits en vrac par **unités physiques** :
- Fûts complets non ouverts (`stockQuantity`)
- Unité actuellement ouverte (`currentUnitRemaining`)
- Ouverture automatique de nouvelles unités quand nécessaire

**Exemple :** Fût 6L avec 4.25L restants
- `stockQuantity = 5` → 5 fûts non ouverts
- `currentUnitRemaining = 4.25` → 4.25L dans fût entamé
- Stock total = 30 + 4.25 = **34.25 litres**

## 🛠️ Développement

### Générer le code Serverpod

Après modification des modèles (`.spy.yaml`) :

```bash
serverpod generate
```

### Créer une migration

Après modification du schéma de base de données :

```bash
serverpod create-migration
# ou avec --force pour ignorer les avertissements
serverpod create-migration --force
```

### Appliquer les migrations

```bash
dart bin/main.dart --apply-migrations
```

## 📚 Documentation

Documentation complète disponible dans le projet frontend :
- `airbar/information/documentation-complete.md`
- `airbar/information/guide-produits-en-vrac.md`
- `airbar/information/synthese-evolution-stock-mars-2026.md`

## 🔐 Configuration

### Fichier `config/development.yaml`

```yaml
apiServer:
  port: 8080
  publicHost: localhost
  publicPort: 8080
  publicScheme: http

insights:
  port: 8081
  publicHost: localhost
  publicPort: 8081
  publicScheme: http

webServer:
  port: 8082
  publicHost: localhost
  publicPort: 8082
  publicScheme: http

database:
  host: localhost
  port: 5432
  name: airbar_backend
  user: postgres
```

### Fichier `config/passwords.yaml` (non versionné)

```yaml
development:
  database: your_password_here
shared:
  encryption: your_32_char_encryption_key
```

## 🧪 Tests

```bash
# Tests unitaires
dart test

# Tests d'intégration
dart test test/integration
```

## 📈 Dernières Évolutions (Mars 2026)

### Gestion du Stock par Unités

**Migration majeure** du système de gestion de stock :
- Avant : Quantités fractionnelles (`stockQuantity: double`)
- Après : Unités complètes + unité entamée (`stockQuantity: int` + `currentUnitRemaining: double?`)

**Avantages :**
- ✅ Correspond à la réalité physique (fûts, caisses)
- ✅ Inventaire simplifié
- ✅ Traçabilité améliorée
- ✅ Alertes pertinentes

Voir `synthese-evolution-stock-mars-2026.md` pour les détails complets.

## 🔗 Liens

- [GitHub Repository](https://github.com/rorophil/airbar_backend)
- [Frontend Flutter](https://github.com/rorophil/airbar)
- [Documentation Serverpod](https://docs.serverpod.dev)

---

**Version:** 2.0  
**Dernière mise à jour:** 10 mars 2026
