
$Kapital = 1000
$Zinssatz = 0.01
$Jahre = 0
$Endkapital = 1500

do {
$Kapital=  $Kapital * $Zinssatz + $Kapital
    $Jahre++
} until ( $Kapital -ge $Endkapital)

<#
do {
    $Kapital=  $Kapital * $Zinssatz + $Kapital
    $Jahre++

} while ( $Kapital -lt $Endkapital)
#>
"Das Kapital muss $Jahre Jahre angelegt werden."