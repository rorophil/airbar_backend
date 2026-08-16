# Documentation AirBar Backend

Ce dossier contient toute la documentation d'installation, de déploiement et de maintenance du serveur AirBar Backend.

**📖 Navigation complète :**
- **[INDEX.md](INDEX.md)** - Navigation détaillée avec scénarios d'utilisation et matrice de décision
- **[RECAPITULATIF.md](RECAPITULATIF.md)** - Résumé complet des fichiers créés et objectifs atteints

---

## 📚 Guides disponibles

### 🚀 Installation et déploiement

| Guide | Audience | Temps | Description |
|-------|----------|-------|-------------|
| **[installation_quickstart.md](installation_quickstart.md)** | 👨‍💻 Experts | 5 min | Installation rapide avec commandes essentielles uniquement. Pour utilisateurs ayant déjà Docker et connaissant Serverpod. |
| **[installation_serveur_production.md](installation_serveur_production.md)** | 👥 Tous | 30 min | **Guide complet** couvrant Windows et Linux, local et distant, avec explications détaillées et contexte. **Recommandé pour premier déploiement.** |

### 🔧 Maintenance et mise à jour

| Guide | Description |
|-------|-------------|
| **[mise_a_jour_serveur.md](mise_a_jour_serveur.md)** | Procédure de mise à jour du serveur depuis GitHub avec sauvegardes et rollback. |

### 🐛 Dépannage

| Guide | Description |
|-------|-------------|
| **[problemes_critiques.md](problemes_critiques.md)** | **⚡ LES 3 PROBLÈMES LES PLUS COURANTS** avec solutions rapides. **À lire EN PREMIER en cas de problème.** |
| **[troubleshooting.md](troubleshooting.md)** | Guide de dépannage exhaustif avec solutions détaillées à tous les problèmes connus (authentification, compilation, Docker, réseau). |

### 🔧 Outils de diagnostic

| Outil | OS | Description |
|-------|-------|-------------|
| **[diagnostic.sh](../airbar_backend_server/diagnostic.sh)** | Linux/macOS | Script Bash générant un rapport de diagnostic complet automatiquement. |
| **[diagnostic.ps1](../airbar_backend_server/diagnostic.ps1)** | Windows | Script PowerShell générant un rapport de diagnostic complet automatiquement. |

**Usage :**
```bash
# Linux/macOS
cd airbar_backend_server
chmod +x diagnostic.sh
./diagnostic.sh

# Windows (PowerShell)
cd airbar_backend_server
.\diagnostic.ps1
```

---

## 🎯 Quel guide choisir ?

### Pour une première installation

**Utilisateur débutant (première fois avec Docker/Serverpod) :**
→ **[installation_serveur_production.md](installation_serveur_production.md)**  
Guide complet avec explications, contexte et procédures détaillées.

**Utilisateur expérimenté (connaît déjà Docker) :**
→ **[installation_quickstart.md](installation_quickstart.md)**  
Installation en 5 minutes avec commandes uniquement.

**Installation sur Windows uniquement :**
→ **[installation_windows.md](installation_windows.md)**  
Guide spécifique avec particularités Windows.

### En cas de problème


1. **D'ABORD** → **[problemes_critiques.md](problemes_critiques.md)**  
   Les 3 problèmes les plus courants (95% des cas) avec solutions rapides.

2. **Ensuite** → **[troubleshooting.md](troubleshooting.md)**  
   Guide exhaustif pour problèmes plus rares ou complexes.

3. **Diagnostic automatique** → Lancer `diagnostic.sh` (Linux) ou `diagnostic.ps1` (Windows)  
   Génère un rapport complet identifiant automatiquement les problème
Solutions aux problèmes courants avec diagnostics.

### Pour mettre à jour un serveur existant

**Récupérer une nouvelle version depuis GitHub :**
→ **[mise_a_jour_serveur.md](mise_a_jour_serveur.md)**  
Procédure de mise à jour avec sauvegardes.

---

## 🔑 Points critiques (leçons apprises)

### 1. Fichiers générés Serverpod

**IMPORTANT :** Les fichiers dans `lib/src/generated/` **DOIVENT** être versionnés dans Git pour un déploiement Docker sans Flutter.

- ✅ **Correct :** Le `.gitignore` à la racine du workspace ne contient PAS `**/generated/`
- ❌ **Erreur :** Ignorer les fichiers générés cause l'erreur "No such file or directory: endpoints.dart"

**Pourquoi ?** La génération nécessite Flutter (~2GB), mais Docker utilise une image Dart légère (~200MB).

### 2. Mots de passe PostgreSQL

**IMPORTANT :** Le mot de passe `POSTGRES_PASSWORD` dans `.env` **DOIT** correspondre EXACTEMENT à `database:` dans `config/passwords.yaml` section `production:`.

- ✅ **Correct :** Les deux fichiers ont le même mot de passe
- ❌ **Erreur :** Mots de passe différents → "password authentication failed for user postgres"

**Si changement de mot de passe :** Supprimer le volume PostgreSQL (`docker volume rm`) avant de redémarrer.

### 3. Ordre de déploiement

**Séquence correcte :**

1. Cloner le projet
2. Créer/éditer `.env` (correspondance avec `passwords.yaml`)
3. `docker compose up -d --build`
4. Attendre que PostgreSQL soit **healthy** (15-20 secondes)
5. Appliquer les migrations (`--apply-migrations`)
6. Redémarrer le serveur

**❌ Erreur courante :** Appliquer les migrations avant que PostgreSQL soit healthy.

---

## 📖 Architecture de référence

```
airbar_backend/
├── airbar_backend_server/      # Serveur Serverpod
│   ├── bin/main.dart            # Point d'entrée
│   ├── lib/
│   │   ├── server.dart          # Configuration serveur
│   │   └── src/
│   │       ├── generated/       # ⚠️ Fichiers générés (à versionner)
│   │       │   ├── endpoints.dart
│   │       │   ├── protocol.dart
│   │       │   └── protocol.yaml
│   │       ├── endpoints/       # Endpoints API
│   │       └── models/          # Modèles de données
│   ├── config/
│   │   ├── production.yaml      # Config production
│   │   └── passwords.yaml       # Secrets (non versionné)
│   ├── migrations/              # Migrations BDD
│   ├── docker-compose.yaml      # Configuration Docker
│   ├── Dockerfile               # Build du serveur
│   ├── .env                     # Variables d'environnement (non versionné)
│   └── .env.example             # Template .env
├── airbar_backend_client/       # Client Dart
│   └── lib/src/protocol/        # Protocole partagé (généré)
└── informations/                # 📚 Documentation (ce dossier)
    ├── README.md                # ← Vous êtes ici
    ├── installation_serveur_production.md
    ├── installation_quickstart.md
    ├── troubleshooting.md
    └── mise_a_jour_serveur.md
```

---

## 🔐 Sécurité - Checklist avant production

- [ ] Changer TOUS les mots de passe dans `passwords.yaml` ET `.env`
- [ ] Utiliser des mots de passe de 32+ caractères (générés aléatoirement)
- [ ] Vérifier que `.env` et `passwords.yaml` ne sont PAS dans Git
- [ ] Configurer un pare-feu (ports 8080-8082 uniquement)
- [ ] Installer un reverse proxy (Nginx) avec SSL/TLS (Let's Encrypt)
- [ ] Configurer les sauvegardes automatiques quotidiennes
- [ ] Restreindre l'accès SSH (clés uniquement, désactiver mot de passe)
- [ ] Configurer la surveillance (monitoring, alertes)
- [ ] Documenter les mots de passe dans un gestionnaire sécurisé (1Password, Bitwarden)

**Générer un mot de passe fort (32 caractères) :**
```bash
openssl rand -base64 32
```

---

## 🆘 Support

**En cas de problème :**

1. Consulter **[troubleshooting.md](troubleshooting.md)**
2. Vérifier les issues GitHub : https://github.com/rorophil/airbar_backend/issues
3. Créer une nouvelle issue avec logs et contexte

**Documentation officielle Serverpod :**
- https://docs.serverpod.dev
- https://github.com/serverpod/serverpod

---

## 📝 Historique des versions

| Version | Date | Changements |
|---------|------|-------------|
| **2.0** | 2026-08-16 | Refonte complète : guide unifié Windows/Linux, troubleshooting exhaustif, quickstart |
| **1.0** | 2026-08-10 | Version initiale (guides séparés Windows, cross-platform) |

---

**Dernière mise à jour :** 2026-08-16  
**Maintenu par :** Philippe Robert ([@rorophil](https://github.com/rorophil))
