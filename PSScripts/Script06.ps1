
$Colors = @('White','Yellow','Darkyellow','Red')

$tempColor = $Colors | Get-Random -Count 1

switch ($tempColor) {

    'White' {
        "Die Farbe ist WEISS"
        break
    }
    'Yellow' {
        "Die Farbe ist GELB"
        break
    }
    'Yellow' {
        "Die Farbe ist DUNKELGELB"
        break
    }
    'Darkyellow' {
        "Die Farbe ist DUNKELGELB"
        break
    }
    'Red' {
        "Die Farbe ist ROT"
        break
    }
    default {
        "Diese Farbe kenne ich noch nicht ..."
    }
}

' *** FINISHED *** '