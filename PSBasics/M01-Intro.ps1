
# Installation PowerShell 7
winget search PowerShell
winget show --id Microsoft.PowerShell
winget install --id Microsoft.PowerShell
winget upgrade 
winget upgrade --id Microsoft.PowerShell

# cmdlets
Get-Command
get-command -verb Write
Get-Command -noun smbshare
Get-Command -name *share*

# Alias
Get-Alias
Get-Alias -Name ls
Get-Alias -Definition Get-ChildItem

New-Alias -name sos -Value Get-Help
Set-Alias -name gsrv -Value Get-Service
