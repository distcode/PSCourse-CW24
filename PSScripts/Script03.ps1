
param (
    [parameter(Mandatory=$true)]
    [string]$Name,

    [int]$Age = 25
)

Write-Host "Guten Tag $Name!"
Write-Host "Du bist wirklich $Age Jahre alt?"
