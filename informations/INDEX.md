# AirBar Backend - Index de la Documentation

**Documentation complète et unifiée - Version 2.0**  
**Dernière mise à jour :** 2026-08-16

---

## 📂 Organisation des Fichiers

### 📍 Dossier : `/informations/`

| Fichier | Type | Audience | Description |
|---------|------|----------|-------------|
| **[README.md](README.md)** | 📖 Navigation | Tous | Guide de navigation principal - COMMENCER ICI |
| **[problemes_critiques.md](problemes_critiques.md)** | ⚡ Dépannage | Tous | LES 3 PROBLÈMES LES PLUS COURANTS - 95% des cas |
| **[installation_quickstart.md](installation_quickstart.md)** | 🚀 Installation | Experts | Installation en 5 minutes - Commandes uniquement |
| **[installation_serveur_production.md](installation_serveur_production.md)** | 📘 Installation | Débutants | Guide complet détaillé Windows/Linux - RECOMMANDÉ |
| **[troubleshooting.md](troubleshooting.md)** | 🔧 Dépannage | Tous | Dépannage exhaustif de tous les problèmes |
| **[mise_a_jour_serveur.md](mise_a_jour_serveur.md)** | 🔄 Maintenance | Tous | Procédure de mise à jour avec sauvegardes |

### 📍 Dossier : `/airbar_backend_server/`

| Fichier | Type | OS | Description |
|---------|------|-----|-------------|
| **[diagnostic.sh](../airbar_backend_server/diagnostic.sh)** | 🔬 Script | Linux/macOS | Diagnostic automatique complet (Bash) |
| **[diagnostic.ps1](../airbar_backend_server/diagnostic.ps1)** | 🔬 Script | Windows | Diagnostic automatique complet (PowerShell) |
| **[.env.example](../airbar_backend_server/.env.example)** | ⚙️ Config | Tous | Template de configuration des secrets |
| **[DEPLOYMENT.md](../airbar_backend_server/DEPLOYMENT.md)** | 📄 Référence | Tous | Guide de déploiement (version initiale) |

---

## 🎯 Scénarios d'utilisation

### Scénario 1 : Première installation (débutant)

**Objectif :** Installer le serveur AirBar pour la première fois sur Windows ou Linux.

1. **Lire** : [installation_serveur_production.md](installation_serveur_production.md)
2. **Suivre** : Les étapes détaillées du guide
3. **En cas de problème** : [problemes_critiques.md](problemes_critiques.md)

**Temps estimé :** 30-45 minutes

---

### Scénario 2 : Installation rapide (expert)

**Objectif :** Installer rapidement sur un serveur avec Docker déjà configuré.

1. **Lire** : [installation_quickstart.md](installation_quickstart.md)
2. **Exécuter** : Les commandes en séquence
3. **En cas de problème** : [problemes_critiques.md](problemes_critiques.md)

**Temps estimé :** 5-10 minutes

---

### Scénario 3 : Problème de déploiement

**Objectif :** Résoudre une erreur pendant l'installation ou le fonctionnement.

**Processus de diagnostic :**

1. **Lancer le diagnostic automatique** :
   ```bash
   # Linux/macOS
   cd airbar_backend_server
   ./diagnostic.sh
   
   # Windows
   cd airbar_backend_server
   .\diagnostic.ps1
   ```

2. **Consulter** : [problemes_critiques.md](problemes_critiques.md)
   - Couvre 95% des problèmes courants
   - Solutions rapides et testées

3. **Si non résolu** : [troubleshooting.md](troubleshooting.md)
   - Dépannage exhaustif
   - Diagnostics avancés

4. **Créer une issue** sur GitHub avec le rapport de diagnostic

**Temps estimé :** 10-30 minutes

---

### Scénario 4 : Mise à jour du serveur

**Objectif :** Mettre à jour le code depuis GitHub.

1. **Lire** : [mise_a_jour_serveur.md](mise_a_jour_serveur.md)
2. **Suivre** : La procédure avec sauvegardes
3. **En cas de problème** : Rollback documenté dans le guide

**Temps estimé :** 15-20 minutes

---



## 🗺️ Cartographie des Problèmes → Solutions

| Symptôme | Solution Rapide | Guide Détaillé |
|----------|-----------------|----------------|
| `password authentication failed` | [problemes_critiques.md](problemes_critiques.md) #1 | [troubleshooting.md](troubleshooting.md) |
| `No such file or directory: endpoints.dart` | [problemes_critiques.md](problemes_critiques.md) #2 | [troubleshooting.md](troubleshooting.md) |
| `You need to have flutter installed` | [problemes_critiques.md](problemes_critiques.md) #3 | [troubleshooting.md](troubleshooting.md) |
| `docker compose command not found` | [troubleshooting.md](troubleshooting.md) | [installation_serveur_production.md](installation_serveur_production.md) |
| `relation does not exist` | [troubleshooting.md](troubleshooting.md) | - |
| `bind: address already in use` | [troubleshooting.md](troubleshooting.md) | - |
| Le serveur redémarre en boucle | `diagnostic.sh` ou `diagnostic.ps1` | [troubleshooting.md](troubleshooting.md) |

---

## 📊 Matrice de décision

```
Vous êtes...                          → Guide recommandé
────────────────────────────────────────────────────────
Débutant avec Docker                  → installation_serveur_production.md
Expert Docker/Serverpod               → installation_quickstart.md
Utilisateur Windows uniquement        → installation_serveur_production.md (section Windows)
Installation sur serveur distant      → installation_serveur_production.md
Installation en local                 → installation_serveur_production.md
                                        
Vous avez...
────────────────────────────────────────────────────────
Une erreur pendant l'installation     → problemes_critiques.md
Un problème non listé                 → diagnostic.sh + troubleshooting.md
Besoin de mettre à jour               → mise_a_jour_serveur.md
```

---

## 🔑 Les 3 Points Critiques à Connaître

### 1. Fichiers Générés Serverpod

**⚠️ DOIVENT être versionnés dans Git**

```bash
# Vérifier
ls lib/src/generated/endpoints.dart
ls lib/src/generated/protocol.dart

# Si absents
git pull origin prod  # Récupérer depuis Git
# OU
serverpod generate    # Générer en local (nécessite Flutter)
```

**Pourquoi ?** Docker utilise une image Dart légère sans Flutter. La génération de code nécessite Flutter, donc les fichiers doivent être pré-générés.

### 2. Mots de Passe PostgreSQL

**⚠️ `.env` DOIT correspondre à `config/passwords.yaml`**

```bash
# Vérifier la correspondance
cat .env | grep POSTGRES_PASSWORD
cat config/passwords.yaml | grep -A 1 "production:" | grep database
# DOIVENT être identiques
```

**Pourquoi ?** PostgreSQL est créé avec le mot de passe de `.env`, mais Serverpod lit celui de `passwords.yaml`. S'ils diffèrent, la connexion échoue.

### 3. Ordre de Déploiement

**⚠️ Respecter la séquence**

1. `docker compose up -d`
2. Attendre PostgreSQL **healthy** (15-20 secondes)
3. `docker compose run --apply-migrations`
4. `docker compose restart airbar_server`

**Pourquoi ?** Appliquer les migrations avant que PostgreSQL soit prêt cause des erreurs.

---

## 📞 Obtenir de l'Aide

### Processus de support

1. **Diagnostic automatique**
   ```bash
   ./diagnostic.sh  # ou diagnostic.ps1 sur Windows
   ```

2. **Consulter la documentation**
   - [problemes_critiques.md](problemes_critiques.md)
   - [troubleshooting.md](troubleshooting.md)

3. **Vérifier les issues GitHub**
   https://github.com/rorophil/airbar_backend/issues

4. **Créer une nouvelle issue**
   - Titre clair et descriptif
   - Joindre le rapport de diagnostic
   - Indiquer OS et versions (Docker, Dart, etc.)
   - Masquer les mots de passe !

---

## 📝 Versions de la Documentation

| Version | Date | Changements Majeurs |
|---------|------|---------------------|
| **2.0** | 2026-08-16 | • Guide unifié Windows/Linux<br>• Scripts de diagnostic automatique<br>• Guide des problèmes critiques<br>• Dépannage exhaustif<br>• Quickstart amélioré |
| **1.0** | 2026-08-10 | • Guides séparés Windows/cross-platform<br>• Documentation initiale |

---

## 🎓 Ressources Complémentaires

- **Documentation Serverpod** : https://docs.serverpod.dev
- **Docker Documentation** : https://docs.docker.com
- **PostgreSQL Docs** : https://www.postgresql.org/docs/
- **Redis Docs** : https://redis.io/documentation

---

**Maintenu par :** Philippe Robert ([@rorophil](https://github.com/rorophil))  
**Dernière révision :** 2026-08-16
