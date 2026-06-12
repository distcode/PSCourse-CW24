
# " " vs. ' '

$temperatur = 24
$bedeckung = 'wolkenlos'

"Heute hat es " + $temperatur + " Grad Celsius und der Himmel ist " + $bedeckung + "."
# shorter
"Heute hat es $temperatur Grad Celsius und der Himmel ist $bedeckung ."
# not possible
'Heute hat es $temperatur Grad Celsius und der Himmel ist $bedeckung .'

# Attention
$htWetter = @{ Temperatur=22; Bedeckung='bedeckt'}

"Heute hat es " + $htWetter.Temperatur + " Grad Celsius und der Himmel ist " + $htWetter.Bedeckung + "."
# shorter - does not work correctly
"Heute hat es $htWetter.Temperatur Grad Celsius und der Himmel ist $htWetter.Bedeckung."
# correct
"Heute hat es $($htWetter.Temperatur) Grad Celsius und der Himmel ist $($htWetter.Bedeckung)."

# also possible
"Heute, am $((Get-Date).Date), hat es $($htWetter.Temperatur) Grad Celsius und der Himmel ist $($htWetter.Bedeckung)."


# Formatting
"Heute hat es $($htWetter.Temperatur.tostring('n1')) Grad Celsius und der Himmel ist $($htWetter.Bedeckung)."

"Heute, am $((Get-Date).Date.tostring('d. MMMM yyyy')), hat es $($htWetter.Temperatur) Grad Celsius und der Himmel ist $($htWetter.Bedeckung)."

"Heute, am {0:dd-MM-yy}, hat es {1:n1} und der Himmel ist {2}." -f ((Get-Date).Date),$htWetter.Temperatur,$htWetter.Bedeckung

"Heute, am {0,14:dd-MM-yy}, hat es {1:n1} und der Himmel ist {2}." -f ((Get-Date).Date),$htWetter.Temperatur,$htWetter.Bedeckung
"Heute, am {0,-14:dd-MM-yy}, hat es {1:n1} und der Himmel ist {2}." -f ((Get-Date).Date),$htWetter.Temperatur,$htWetter.Bedeckung

# String operations
# split
"Papa-Oscar-Whiskey-Echo-Romeo-Sierra-Hotel-Echo-Lima-Lima" -split '-'
("Papa-Oscar-Whiskey-Echo-Romeo-Sierra-Hotel-Echo-Lima-Lima").split('-')

# join
-join ("Power", "Shell")

# replace
"P0werShell r0cks." -replace '0','o'
"PowerShell rocks." -replace '\.','!'
("PowerShell rocks.").replace('.','!')


