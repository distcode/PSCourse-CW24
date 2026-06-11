
function Write-Hello {

    Write-Host "Guten Tag $env:Username!" -ForegroundColor White -BackgroundColor DarkRed
    Write-Host "Es ist $((Get-Date).Date.ToLongDateString())." -ForegroundColor White -BackgroundColor DarkRed
}