param(
    [string]$SourceFolder = "C:\Backup",
    [string]$ContainerUrl = "https://<storage>.blob.core.windows.net/backups?<SAS>"
)

# Backup carpeta completa a Azure Blob
& "C:\Program Files\AzCopy\AzCopy.exe" copy $SourceFolder $ContainerUrl --recursive=true
