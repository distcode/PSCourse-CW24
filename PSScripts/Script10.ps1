
Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

try {

    Get-ChildItem hklm:\ # -ErrorAction Stop

    $a = 100
    $b = Read-Host 'Bitte eine Zahle eingeben'
    $result = $a / $b
    Write-Host "Das Ergebnis ist: $result"
}
catch {
    Write-Host "Fehler!!!!"
    return
}

'*** finished *** '
