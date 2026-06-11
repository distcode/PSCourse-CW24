
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

    $Bedeckung = 'bewölkt','wolkenlos' | Get-Random -Count 1
    $Temperatur = Get-Random -Minimum 16 -Maximum 31

    "In $City hat es gerade $temperatur Grad und der Himmel ist $bedeckung"
}