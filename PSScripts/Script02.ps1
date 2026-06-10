

Write-Host `
    -object "Guten Tag!"

Get-Process p*

#region Demo
# Get-Service w*

<#
Get-SmbShare -Name Admin$
#>
#endregion

Get-Service w*
Get-SmbShare -Name Admin$

Get-ChildItem C:\Windows -File |
Where-Object {
    $_.Length -gt 1MB
}
