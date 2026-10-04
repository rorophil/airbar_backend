#!/bin/bash
# =============================================================================
# AirBar Backend - Script de diagnostic automatique
# =============================================================================
# Ce script collecte toutes les informations nécessaires pour diagnostiquer
# les problèmes de déploiement du serveur AirBar Backend.
#
# Usage:
#   chmod +x diagnostic.sh
#   ./diagnostic.sh
#
# Le rapport sera sauvegardé dans : diagnostic_YYYYMMDD_HHMMSS.log
# =============================================================================

set -e

# Couleurs pour l'affichage
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Nom du fichier de sortie
OUTPUT_FILE="diagnostic_$(date +%Y%m%d_%H%M%S).log"

echo "=========================================="
echo "  AirBar Backend - Diagnostic Complet"
echo "=========================================="
echo ""
echo "Collecte des informations système..."
echo "Rapport: $OUTPUT_FILE"
echo ""

# Fonction pour afficher et logger
log_section() {
    echo -e "${BLUE}=== $1 ===${NC}" | tee -a "$OUTPUT_FILE"
}

log_info() {
    echo -e "${GREEN}✓${NC} $1" | tee -a "$OUTPUT_FILE"
}

log_warning() {
    echo -e "${YELLOW}⚠${NC} $1" | tee -a "$OUTPUT_FILE"
}

log_error() {
    echo -e "${RED}✗${NC} $1" | tee -a "$OUTPUT_FILE"
}

# Début du rapport
{
    echo "=========================================="
    echo "  AIRBAR BACKEND - RAPPORT DE DIAGNOSTIC"
    echo "=========================================="
    echo "Date: $(date)"
    echo "Hostname: $(hostname)"
    echo "User: $(whoami)"
    echo ""
} >> "$OUTPUT_FILE"

# =============================================================================
# 1. INFORMATIONS SYSTÈME
# =============================================================================
log_section "1. INFORMATIONS SYSTÈME"

{
    echo "OS: $(uname -s)"
    echo "Kernel: $(uname -r)"
    echo "Architecture: $(uname -m)"
    
    if [ -f /etc/os-release ]; then
        echo ""
        echo "Distribution:"
        cat /etc/os-release
    fi
    
    echo ""
    echo "Mémoire:"
    free -h
    
    echo ""
    echo "Disque:"
    df -h | grep -E '^/dev/|Filesystem'
    
    echo ""
} >> "$OUTPUT_FILE" 2>&1

# =============================================================================
# 2. VERSIONS DES OUTILS
# =============================================================================
log_section "2. VERSIONS DES OUTILS"

{
    echo "Git:"
    git --version || echo "Git non installé"
    
    echo ""
    echo "Docker:"
    docker --version || echo "Docker non installé"
    
    echo ""
    echo "Docker Compose:"
    docker compose version || echo "Docker Compose non installé"
    
    echo ""
    echo "Dart (si disponible):"
    dart --version 2>&1 || echo "Dart non installé (optionnel)"
    
    echo ""
    echo "Flutter (si disponible):"
    flutter --version 2>&1 || echo "Flutter non installé (optionnel)"
    
    echo ""
} >> "$OUTPUT_FILE" 2>&1

# =============================================================================
# 3. ÉTAT DES SERVICES DOCKER
# =============================================================================
log_section "3. ÉTAT DES SERVICES DOCKER"

{
    echo "Services en cours d'exécution:"
    docker compose ps 2>&1 || echo "Erreur: docker compose ps"
    
    echo ""
    echo "Détails des conteneurs:"
    docker compose ps --format json 2>&1 | grep -v "^$" || echo "Format JSON non disponible"
    
    echo ""
} >> "$OUTPUT_FILE" 2>&1

# =============================================================================
# 4. SANTÉ DES CONTENEURS
# =============================================================================
log_section "4. SANTÉ DES CONTENEURS"

{
    echo "PostgreSQL:"
    docker compose exec -T postgres pg_isready -U postgres 2>&1 || echo "PostgreSQL non accessible"
    
    echo ""
    echo "Redis:"
    docker compose exec -T redis redis-cli ping 2>&1 || echo "Redis non accessible"
    
    echo ""
} >> "$OUTPUT_FILE" 2>&1

# =============================================================================
# 5. LOGS RÉCENTS
# =============================================================================
log_section "5. LOGS RÉCENTS (dernières 50 lignes)"

{
    echo "--- SERVEUR AIRBAR ---"
    docker compose logs --tail 50 airbar_server 2>&1 || echo "Logs serveur non disponibles"
    
    echo ""
    echo "--- POSTGRESQL ---"
    docker compose logs --tail 30 postgres 2>&1 || echo "Logs PostgreSQL non disponibles"
    
    echo ""
    echo "--- REDIS ---"
    docker compose logs --tail 20 redis 2>&1 || echo "Logs Redis non disponibles"
    
    echo ""
} >> "$OUTPUT_FILE" 2>&1

# =============================================================================
# 6. CONFIGURATION RÉSEAU
# =============================================================================
log_section "6. CONFIGURATION RÉSEAU"

{
    echo "Réseaux Docker:"
    docker network ls | grep airbar
    
    echo ""
    echo "Détails du réseau airbar:"
    docker network inspect airbar_backend_server_airbar_network 2>&1 || echo "Réseau non trouvé"
    
    echo ""
    echo "Ports en écoute (8080-8082):"
    netstat -tuln 2>&1 | grep -E ':(8080|8081|8082)' || ss -tuln | grep -E ':(8080|8081|8082)' || echo "netstat/ss non disponible"
    
    echo ""
} >> "$OUTPUT_FILE" 2>&1

# =============================================================================
# 7. VOLUMES DOCKER
# =============================================================================
log_section "7. VOLUMES DOCKER"

{
    echo "Volumes airbar:"
    docker volume ls | grep airbar
    
    echo ""
    echo "Taille des volumes:"
    docker system df -v 2>&1 | grep -A 20 "Local Volumes" || echo "docker system df non disponible"
    
    echo ""
} >> "$OUTPUT_FILE" 2>&1

# =============================================================================
# 8. RESSOURCES UTILISÉES
# =============================================================================
log_section "8. RESSOURCES UTILISÉES"

{
    echo "Utilisation par conteneur:"
    docker stats --no-stream --format "table {{.Container}}\t{{.CPUPerc}}\t{{.MemUsage}}\t{{.NetIO}}\t{{.BlockIO}}" 2>&1 || echo "docker stats non disponible"
    
    echo ""
} >> "$OUTPUT_FILE" 2>&1

# =============================================================================
# 9. CONFIGURATION DU PROJET
# =============================================================================
log_section "9. CONFIGURATION DU PROJET"

{
    echo "Dossier courant:"
    pwd
    
    echo ""
    echo "Fichiers présents:"
    ls -lah | grep -E '(docker-compose|Dockerfile|\.env|config|lib)'
    
    echo ""
    echo "Vérification .env (masqué):"
    if [ -f .env ]; then
        echo ".env existe"
        cat .env | grep -v "^#" | grep "PASSWORD" | sed 's/=.*/=***/' || echo "Aucune variable PASSWORD trouvée"
    else
        echo "⚠️ .env MANQUANT !"
    fi
    
    echo ""
    echo "Vérification config/passwords.yaml:"
    if [ -f config/passwords.yaml ]; then
        echo "passwords.yaml existe"
        cat config/passwords.yaml | grep -A 8 "production:" | sed 's/: .*/: ***/g' || echo "Section production non trouvée"
    else
        echo "⚠️ config/passwords.yaml MANQUANT !"
    fi
    
    echo ""
    echo "Vérification config/production.yaml:"
    if [ -f config/production.yaml ]; then
        echo "production.yaml existe"
        head -30 config/production.yaml
    else
        echo "⚠️ config/production.yaml MANQUANT !"
    fi
    
    echo ""
} >> "$OUTPUT_FILE" 2>&1

# =============================================================================
# 10. FICHIERS GÉNÉRÉS SERVERPOD
# =============================================================================
log_section "10. FICHIERS GÉNÉRÉS SERVERPOD"

{
    echo "Vérification lib/src/generated/:"
    if [ -d lib/src/generated ]; then
        echo "Dossier generated existe"
        ls -lh lib/src/generated/ | head -20
        
        echo ""
        echo "Fichiers critiques:"
        [ -f lib/src/generated/endpoints.dart ] && echo "✓ endpoints.dart existe" || echo "✗ endpoints.dart MANQUANT"
        [ -f lib/src/generated/protocol.dart ] && echo "✓ protocol.dart existe" || echo "✗ protocol.dart MANQUANT"
        [ -f lib/src/generated/protocol.yaml ] && echo "✓ protocol.yaml existe" || echo "✗ protocol.yaml MANQUANT"
    else
        echo "✗ Dossier lib/src/generated/ MANQUANT !"
    fi
    
    echo ""
} >> "$OUTPUT_FILE" 2>&1

# =============================================================================
# 11. TESTS DE CONNECTIVITÉ
# =============================================================================
log_section "11. TESTS DE CONNECTIVITÉ"

{
    echo "Test API (localhost:8080):"
    curl -s -o /dev/null -w "Status: %{http_code}\n" http://localhost:8080/ 2>&1 || echo "Échec de connexion à l'API"
    
    echo ""
    echo "Test Insights (localhost:8081):"
    curl -s -o /dev/null -w "Status: %{http_code}\n" http://localhost:8081/ 2>&1 || echo "Échec de connexion à Insights"
    
    echo ""
    echo "Réponse complète de l'API:"
    curl -s http://localhost:8080/ 2>&1 || echo "Pas de réponse"
    
    echo ""
} >> "$OUTPUT_FILE" 2>&1

# =============================================================================
# 12. ÉTAT GIT
# =============================================================================
log_section "12. ÉTAT GIT"

{
    echo "Branche actuelle:"
    git branch --show-current 2>&1 || echo "Pas un dépôt git"
    
    echo ""
    echo "Dernier commit:"
    git log -1 --oneline 2>&1 || echo "Pas de commits"
    
    echo ""
    echo "Status:"
    git status 2>&1 || echo "git status non disponible"
    
    echo ""
} >> "$OUTPUT_FILE" 2>&1

# =============================================================================
# 13. PROBLÈMES DÉTECTÉS
# =============================================================================
log_section "13. ANALYSE ET PROBLÈMES DÉTECTÉS"

PROBLEMS_FOUND=0

{
    echo "Analyse automatique des problèmes:"
    echo ""
    
    # Vérification .env
    if [ ! -f .env ]; then
        echo "✗ PROBLÈME : Fichier .env manquant"
        echo "  Solution: cp .env.example .env && nano .env"
        PROBLEMS_FOUND=$((PROBLEMS_FOUND + 1))
    fi
    
    # Vérification fichiers générés
    if [ ! -f lib/src/generated/endpoints.dart ]; then
        echo "✗ PROBLÈME : Fichiers générés Serverpod manquants"
        echo "  Solution: Versionner les fichiers générés ou exécuter 'serverpod generate'"
        PROBLEMS_FOUND=$((PROBLEMS_FOUND + 1))
    fi
    
    # Vérification services
    if ! docker compose ps | grep -q "Up (healthy).*postgres"; then
        echo "✗ PROBLÈME : PostgreSQL n'est pas healthy"
        echo "  Solution: docker compose logs postgres"
        PROBLEMS_FOUND=$((PROBLEMS_FOUND + 1))
    fi
    
    if ! docker compose ps | grep -q "Up.*airbar_server"; then
        echo "✗ PROBLÈME : Le serveur AirBar n'est pas démarré"
        echo "  Solution: docker compose logs airbar_server"
        PROBLEMS_FOUND=$((PROBLEMS_FOUND + 1))
    fi
    
    # Vérification logs d'erreur
    if docker compose logs airbar_server 2>&1 | grep -q "password authentication failed"; then
        echo "✗ PROBLÈME : Échec d'authentification PostgreSQL"
        echo "  Solution: Vérifier correspondance .env ↔ config/passwords.yaml"
        echo "  Voir: troubleshooting.md section 'Problèmes d'authentification'"
        PROBLEMS_FOUND=$((PROBLEMS_FOUND + 1))
    fi
    
    if docker compose logs airbar_server 2>&1 | grep -q "No such file or directory.*endpoints.dart"; then
        echo "✗ PROBLÈME : Fichiers générés manquants à la compilation"
        echo "  Solution: Versionner lib/src/generated/ dans Git"
        echo "  Voir: troubleshooting.md section 'Problèmes de compilation'"
        PROBLEMS_FOUND=$((PROBLEMS_FOUND + 1))
    fi
    
    echo ""
    if [ $PROBLEMS_FOUND -eq 0 ]; then
        echo "✓ Aucun problème majeur détecté"
    else
        echo "⚠️  Total: $PROBLEMS_FOUND problème(s) détecté(s)"
        echo ""
        echo "Consultez le guide de dépannage: informations/troubleshooting.md"
    fi
    
    echo ""
} >> "$OUTPUT_FILE" 2>&1

# =============================================================================
# FIN DU RAPPORT
# =============================================================================
{
    echo ""
    echo "=========================================="
    echo "  FIN DU RAPPORT DE DIAGNOSTIC"
    echo "=========================================="
    echo "Généré le: $(date)"
    echo ""
} >> "$OUTPUT_FILE"

# Affichage du résumé
echo ""
echo "=========================================="
log_info "Diagnostic terminé !"
echo ""
echo "Rapport sauvegardé dans: $OUTPUT_FILE"
echo ""

if [ $PROBLEMS_FOUND -gt 0 ]; then
    log_warning "$PROBLEMS_FOUND problème(s) détecté(s)"
    echo ""
    echo "Consultez le rapport complet pour plus de détails."
    echo "Guide de dépannage: informations/troubleshooting.md"
else
    log_info "Aucun problème majeur détecté"
fi

echo ""
echo "Pour partager ce rapport (masquez les mots de passe) :"
echo "  cat $OUTPUT_FILE | grep -v 'PASSWORD.*=' > ${OUTPUT_FILE%.log}_public.log"
echo ""
echo "=========================================="
