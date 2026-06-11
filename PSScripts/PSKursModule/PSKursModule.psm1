
function Write-Hello {

    Write-Host "Guten Tag $env:Username!" -ForegroundColor White -BackgroundColor DarkRed
    Write-Host "Es ist $((Get-Date).Date.ToLongDateString())." -ForegroundColor White -BackgroundColor DarkRed
}

function Test-Foo {
    "I'am doing foo ..."
}

function Get-Weather {

    param (
        [string]$City = 'Vienna'
    )

    Invoke-RestMethod -Uri "https://wttr.in/$city"
}