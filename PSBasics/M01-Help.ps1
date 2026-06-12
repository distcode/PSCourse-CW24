
# Install help - run as administrator
Update-Help -Force

# Save & install help - run as administrator
Save-Help -DestinationPath c:\anyDirectory -Force
Update-Help -SourcePath \\serverX\anyDirectory -Force

# use help
Get-Help Write-Host
Get-Help Write-Host -Detailed
Get-Help Write-Host -Examples

Get-Help Write-Host -Online

Get-Help Write-Host -ShowWindow

# abouts
Get-Help about_*
Get-Help about_WQL

Get-Help about_WQL -ShowWindow