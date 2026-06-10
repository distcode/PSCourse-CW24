
$a = Get-Random -Minimum 1 -Maximum 100

$b = ($true,$false) | Get-Random -Count 1

if ( $b ) {
    "b ist gerade WAHR"
}
else {
    "b ist gerade FALSCH"
}

return


if ( $a -gt 50 ) { 
    "Die Zahl ist größer als 50, nämlich $a."    
}

' *** FINISHED *** '
<#
if ( $a -gt 50 ) {
    # true
    "Die Zahl ist größer als 50, nämlich $a."
}
else {
    # false
    "Die Zahl ist NICHT größer als 50, nämlich $a."
}
    #>