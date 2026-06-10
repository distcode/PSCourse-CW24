
$Colors = @('White','Yellow','Darkyellow','Magenta','Red','Darkred','Cyan')

foreach ( $tempColor in $Colors) {
    if ( $tempColor -eq 'Darkyellow' ) {
        continue
    }
    Write-Host 'Rainbow' -ForegroundColor $tempColor
}