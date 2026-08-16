# =============================================================================
# AirBar Backend - Script de diagnostic automatique (Windows PowerShell)
# =============================================================================
# Ce script collecte toutes les informations nécessaires pour diagnostiquer
# les problèmes de déploiement du serveur AirBar Backend sur Windows.
#
# Usage:
#   .\diagnostic.ps1
#
# Le rapport sera sauvegardé dans : diagnostic_YYYYMMDD_HHMMSS.log
# =============================================================================

$ErrorActionPreference = "SilentlyContinue"

# Nom du fichier de sortie
$timestamp = Get-Date -Format "yyyyMMdd_HHmmss"
$outputFile = "diagnostic_$timestamp.log"

Write-Host "==========================================" -ForegroundColor Cyan
Write-Host "  AirBar Backend - Diagnostic Complet" -ForegroundColor Cyan
Write-Host "==========================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "Collecte des informations système..." -ForegroundColor Yellow
Write-Host "Rapport: $outputFile" -ForegroundColor Yellow
Write-Host ""

# Fonction pour logger
function Log-Section {
    param([string]$message)
    $output = "=== $message ==="
    Write-Host $output -ForegroundColor Blue
    Add-Content -Path $outputFile -Value $output
}

function Log-Info {
    param([string]$message)
    Write-Host "✓ $message" -ForegroundColor Green
    Add-Content -Path $outputFile -Value "✓ $message"
}

function Log-Warning {
    param([string]$message)
    Write-Host "⚠ $message" -ForegroundColor Yellow
    Add-Content -Path $outputFile -Value "⚠ $message"
}

function Log-Error {
    param([string]$message)
    Write-Host "✗ $message" -ForegroundColor Red
    Add-Content -Path $outputFile -Value "✗ $message"
}

# Début du rapport
@"
==========================================
  AIRBAR BACKEND - RAPPORT DE DIAGNOSTIC
==========================================
Date: $(Get-Date)
Hostname: $env:COMPUTERNAME
User: $env:USERNAME

"@ | Out-File -FilePath $outputFile

# =============================================================================
# 1. INFORMATIONS SYSTÈME
# =============================================================================
Log-Section "1. INFORMATIONS SYSTÈME"

$systemInfo = @"

OS: $(Get-CimInstance Win32_OperatingSystem | Select-Object -ExpandProperty Caption)
Version: $(Get-CimInstance Win32_OperatingSystem | Select-Object -ExpandProperty Version)
Architecture: $env:PROCESSOR_ARCHITECTURE

Mémoire:
$(Get-CimInstance Win32_ComputerSystem | Select-Object TotalPhysicalMemory | Format-List | Out-String)

Disque:
$(Get-PSDrive -PSProvider FileSystem | Where-Object {$_.Used -gt 0} | Select-Object Name, @{Name='Used(GB)';Expression={[math]::Round($_.Used/1GB,2)}}, @{Name='Free(GB)';Expression={[math]::Round($_.Free/1GB,2)}} | Format-Table | Out-String)

"@
Add-Content -Path $outputFile -Value $systemInfo

# =============================================================================
# 2. VERSIONS DES OUTILS
# =============================================================================
Log-Section "2. VERSIONS DES OUTILS"

$versions = @"

Git:
$(git --version 2>&1 | Out-String)

Docker:
$(docker --version 2>&1 | Out-String)

Docker Compose:
$(docker compose version 2>&1 | Out-String)

Dart (si disponible):
$(dart --version 2>&1 | Out-String)

Flutter (si disponible):
$(flutter --version 2>&1 | Out-String)

"@
Add-Content -Path $outputFile -Value $versions

# =============================================================================
# 3. ÉTAT DES SERVICES DOCKER
# =============================================================================
Log-Section "3. ÉTAT DES SERVICES DOCKER"

$dockerServices = @"

Services en cours d'exécution:
$(docker compose ps 2>&1 | Out-String)

"@
Add-Content -Path $outputFile -Value $dockerServices

# =============================================================================
# 4. SANTÉ DES CONTENEURS
# =============================================================================
Log-Section "4. SANTÉ DES CONTENEURS"

$health = @"

PostgreSQL:
$(docker compose exec -T postgres pg_isready -U postgres 2>&1 | Out-String)

Redis:
$(docker compose exec -T redis redis-cli ping 2>&1 | Out-String)

"@
Add-Content -Path $outputFile -Value $health

# =============================================================================
# 5. LOGS RÉCENTS
# =============================================================================
Log-Section "5. LOGS RÉCENTS (dernières 50 lignes)"

$logs = @"

--- SERVEUR AIRBAR ---
$(docker compose logs --tail 50 airbar_server 2>&1 | Out-String)

--- POSTGRESQL ---
$(docker compose logs --tail 30 postgres 2>&1 | Out-String)

--- REDIS ---
$(docker compose logs --tail 20 redis 2>&1 | Out-String)

"@
Add-Content -Path $outputFile -Value $logs

# =============================================================================
# 6. CONFIGURATION RÉSEAU
# =============================================================================
Log-Section "6. CONFIGURATION RÉSEAU"

$network = @"

Réseaux Docker:
$(docker network ls 2>&1 | Select-String "airbar" | Out-String)

Ports en écoute (8080-8082):
$(netstat -ano 2>&1 | Select-String ":808[0-2]" | Out-String)

"@
Add-Content -Path $outputFile -Value $network

# =============================================================================
# 7. VOLUMES DOCKER
# =============================================================================
Log-Section "7. VOLUMES DOCKER"

$volumes = @"

Volumes airbar:
$(docker volume ls 2>&1 | Select-String "airbar" | Out-String)

Taille des volumes:
$(docker system df -v 2>&1 | Out-String)

"@
Add-Content -Path $outputFile -Value $volumes

# =============================================================================
# 8. RESSOURCES UTILISÉES
# =============================================================================
Log-Section "8. RESSOURCES UTILISÉES"

$resources = @"

Utilisation par conteneur:
$(docker stats --no-stream --format "table {{.Container}}\t{{.CPUPerc}}\t{{.MemUsage}}" 2>&1 | Out-String)

"@
Add-Content -Path $outputFile -Value $resources

# =============================================================================
# 9. CONFIGURATION DU PROJET
# =============================================================================
Log-Section "9. CONFIGURATION DU PROJET"

$config = @"

Dossier courant:
$(Get-Location)

Fichiers présents:
$(Get-ChildItem | Where-Object {$_.Name -match '(docker-compose|Dockerfile|\.env|config|lib)'} | Format-Table Name, Length, LastWriteTime | Out-String)

Vérification .env (masqué):
$((Test-Path .env) ? ".env existe`n$(Get-Content .env | Select-String 'PASSWORD' | ForEach-Object {$_ -replace '=.*', '=***'})" : "⚠️ .env MANQUANT !")

Vérification config/passwords.yaml:
$((Test-Path config/passwords.yaml) ? "passwords.yaml existe`n$(Get-Content config/passwords.yaml | Select-String -Pattern 'production:' -Context 0,8 | ForEach-Object {$_ -replace ': .*', ': ***'})" : "⚠️ config/passwords.yaml MANQUANT !")

Vérification config/production.yaml:
$((Test-Path config/production.yaml) ? "production.yaml existe`n$(Get-Content config/production.yaml | Select-Object -First 30)" : "⚠️ config/production.yaml MANQUANT !")

"@
Add-Content -Path $outputFile -Value $config

# =============================================================================
# 10. FICHIERS GÉNÉRÉS SERVERPOD
# =============================================================================
Log-Section "10. FICHIERS GÉNÉRÉS SERVERPOD"

$generated = @"

Vérification lib/src/generated/:
$((Test-Path lib/src/generated) ? "Dossier generated existe`n$(Get-ChildItem lib/src/generated | Select-Object -First 20 | Format-Table Name, Length | Out-String)`nFichiers critiques:`n$((Test-Path lib/src/generated/endpoints.dart) ? '✓ endpoints.dart existe' : '✗ endpoints.dart MANQUANT')`n$((Test-Path lib/src/generated/protocol.dart) ? '✓ protocol.dart existe' : '✗ protocol.dart MANQUANT')`n$((Test-Path lib/src/generated/protocol.yaml) ? '✓ protocol.yaml existe' : '✗ protocol.yaml MANQUANT')" : "✗ Dossier lib/src/generated/ MANQUANT !")

"@
Add-Content -Path $outputFile -Value $generated

# =============================================================================
# 11. TESTS DE CONNECTIVITÉ
# =============================================================================
Log-Section "11. TESTS DE CONNECTIVITÉ"

try {
    $apiTest = Invoke-WebRequest -Uri "http://localhost:8080/" -TimeoutSec 3 -UseBasicParsing
    $apiStatus = "Status: $($apiTest.StatusCode)"
    $apiResponse = $apiTest.Content
} catch {
    $apiStatus = "Échec de connexion à l'API"
    $apiResponse = $_.Exception.Message
}

try {
    $insightsTest = Invoke-WebRequest -Uri "http://localhost:8081/" -TimeoutSec 3 -UseBasicParsing
    $insightsStatus = "Status: $($insightsTest.StatusCode)"
} catch {
    $insightsStatus = "Échec de connexion à Insights"
}

$connectivity = @"

Test API (localhost:8080):
$apiStatus

Test Insights (localhost:8081):
$insightsStatus

Réponse complète de l'API:
$apiResponse

"@
Add-Content -Path $outputFile -Value $connectivity

# =============================================================================
# 12. ÉTAT GIT
# =============================================================================
Log-Section "12. ÉTAT GIT"

$gitInfo = @"

Branche actuelle:
$(git branch --show-current 2>&1 | Out-String)

Dernier commit:
$(git log -1 --oneline 2>&1 | Out-String)

Status:
$(git status 2>&1 | Out-String)

"@
Add-Content -Path $outputFile -Value $gitInfo

# =============================================================================
# 13. PROBLÈMES DÉTECTÉS
# =============================================================================
Log-Section "13. ANALYSE ET PROBLÈMES DÉTECTÉS"

$problemsFound = 0
$problems = @"

Analyse automatique des problèmes:

"@

# Vérification .env
if (-not (Test-Path .env)) {
    $problems += "✗ PROBLÈME : Fichier .env manquant`n"
    $problems += "  Solution: copy .env.example .env ; notepad .env`n`n"
    $problemsFound++
}

# Vérification fichiers générés
if (-not (Test-Path lib/src/generated/endpoints.dart)) {
    $problems += "✗ PROBLÈME : Fichiers générés Serverpod manquants`n"
    $problems += "  Solution: Versionner les fichiers générés ou exécuter 'serverpod generate'`n`n"
    $problemsFound++
}

# Vérification services
$postgresHealthy = docker compose ps 2>&1 | Select-String "Up.*healthy.*postgres"
if (-not $postgresHealthy) {
    $problems += "✗ PROBLÈME : PostgreSQL n'est pas healthy`n"
    $problems += "  Solution: docker compose logs postgres`n`n"
    $problemsFound++
}

$serverUp = docker compose ps 2>&1 | Select-String "Up.*airbar_server"
if (-not $serverUp) {
    $problems += "✗ PROBLÈME : Le serveur AirBar n'est pas démarré`n"
    $problems += "  Solution: docker compose logs airbar_server`n`n"
    $problemsFound++
}

# Vérification logs d'erreur
$authError = docker compose logs airbar_server 2>&1 | Select-String "password authentication failed"
if ($authError) {
    $problems += "✗ PROBLÈME : Échec d'authentification PostgreSQL`n"
    $problems += "  Solution: Vérifier correspondance .env ↔ config/passwords.yaml`n"
    $problems += "  Voir: troubleshooting.md section 'Problèmes d'authentification'`n`n"
    $problemsFound++
}

$missingFiles = docker compose logs airbar_server 2>&1 | Select-String "No such file or directory.*endpoints.dart"
if ($missingFiles) {
    $problems += "✗ PROBLÈME : Fichiers générés manquants à la compilation`n"
    $problems += "  Solution: Versionner lib/src/generated/ dans Git`n"
    $problems += "  Voir: troubleshooting.md section 'Problèmes de compilation'`n`n"
    $problemsFound++
}

if ($problemsFound -eq 0) {
    $problems += "✓ Aucun problème majeur détecté`n"
} else {
    $problems += "⚠️  Total: $problemsFound problème(s) détecté(s)`n`n"
    $problems += "Consultez le guide de dépannage: informations/troubleshooting.md`n"
}

Add-Content -Path $outputFile -Value $problems

# =============================================================================
# FIN DU RAPPORT
# =============================================================================
@"

==========================================
  FIN DU RAPPORT DE DIAGNOSTIC
==========================================
Généré le: $(Get-Date)

"@ | Add-Content -Path $outputFile

# Affichage du résumé
Write-Host ""
Write-Host "==========================================" -ForegroundColor Cyan
Log-Info "Diagnostic terminé !"
Write-Host ""
Write-Host "Rapport sauvegardé dans: $outputFile" -ForegroundColor Cyan
Write-Host ""

if ($problemsFound -gt 0) {
    Log-Warning "$problemsFound problème(s) détecté(s)"
    Write-Host ""
    Write-Host "Consultez le rapport complet pour plus de détails." -ForegroundColor Yellow
    Write-Host "Guide de dépannage: informations\troubleshooting.md" -ForegroundColor Yellow
} else {
    Log-Info "Aucun problème majeur détecté"
}

Write-Host ""
Write-Host "Pour partager ce rapport (masquez les mots de passe) :" -ForegroundColor Cyan
Write-Host "  Get-Content $outputFile | Where-Object {`$_ -notmatch 'PASSWORD.*='} | Out-File ${outputFile.Replace('.log','_public.log')}" -ForegroundColor Gray
Write-Host ""
Write-Host "==========================================" -ForegroundColor Cyan
