param(
    [Parameter(Mandatory=$true)]
    [string]$SourceFolder,

    [Parameter(Mandatory=$true)]
    [string]$ContainerUrl,

    [string]$AzCopyPath = "C:\Program Files\AzCopy\AzCopy.exe",

    [switch]$DryRun
)

# =========================
# LOGGING
# =========================
$logFile = "backup.log"

function Log {
    param([string]$message)

    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    $entry = "$timestamp - $message"

    Write-Host $entry
    $entry | Out-File -FilePath $logFile -Append
}

# =========================
# VALIDACIONES
# =========================
if (!(Test-Path $SourceFolder)) {
    Log "❌ Carpeta origen no existe: $SourceFolder"
    exit
}

if (!(Test-Path $AzCopyPath)) {
    Log "❌ AzCopy no encontrado en: $AzCopyPath"
    exit
}

Log "📁 Origen: $SourceFolder"
Log "☁️ Destino: Azure Blob"

# =========================
# COMANDO AZCOPY
# =========================
$command = "`"$AzCopyPath`" copy `"$SourceFolder`" `"$ContainerUrl`" --recursive=true"

if ($DryRun) {
    Log "🟡 [SIMULACIÓN] Se ejecutaría:"
    Log $command
} else {
    try {
        Log "🚀 Iniciando backup..."

        Invoke-Expression $command

        Log "✅ Backup completado correctamente"
    } catch {
        Log "❌ Error durante el backup"
        Log $_
    }
}
