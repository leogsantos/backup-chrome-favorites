# Caminho origem (favoritos do Chrome)
$source = "$env:LOCALAPPDATA\Google\Chrome\User Data\Default\Bookmarks"

# Caminho destino - Altere aqui como desejar, mas precisa ser um arquivo '.json'
$destination = "C:\Backup\Chrome\Bookmarks_backup.json"

# Cria a pasta caso não exista
$destFolder = Split-Path $destination
if (!(Test-Path $destFolder)) {
    New-Item -ItemType Directory -Path $destFolder -Force
}

# Copia o arquivo (sobrescreve automaticamente)
Copy-Item -Path $source -Destination $destination -Force

Write-Output "Backup realizado em $(Get-Date)"
