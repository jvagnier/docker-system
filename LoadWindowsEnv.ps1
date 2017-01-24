Write-Host "[x] Starting Docker Machine environment..."
docker-machine env --shell powershell | Invoke-Expression
Write-Host "[-] Done !"