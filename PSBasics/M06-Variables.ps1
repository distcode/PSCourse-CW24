 # Variables
$a = 100
$a

# calculating in PS
$a + 6
$a - 6
$a * 6
$a / 6
$a % 6
$b = 20
$a / $b
$c = 'PowerShell Kurs'
$c + $a
$a + $c
$c.GetType()
$a.GetType()
[int]$d = 234

# Array
$arr1 = 'Graz','Klagenfurt','Linz','Wien'
$arr1
$arr1[1]
$arr1 = $arr1 + 'Bregenz'
$arr1
$arr1 += 'Salzburg'
$arr1
$arr1 | Get-Member
$arr1.Remove(1)
$arr1.GetType()
$arr1.count
$arr1
$arr1.Contains('Wien')
$arr1.Contains('St. PÃ¶lten')
$arr1.Contains('wien')
$arr1 -contains 'Wien'
$arr1 -contains 'wien'
$arr1 -ccontains 'wien'
'Bregenz' -in $arr1
'bregenz' -cin $arr1
$arr2 = 'Paris'
$arr2 += 'Madrid'
$arr2
$arr2.GetType()
$arr2 = @() # Empty array
$arr2 += 'Paris'
$arr2 += 'Madrid'
$arr2

# hashtable
$ht1 = @{ Marke='Ford'; kw=110; Farbe='black' }
$ht1
$ht1['Marke']
$ht1.Marke
$ht1.Marke = 'VM'
$ht1
$ht1.Marke = 'VW'
$ht1.kw / 3 * 4
$ht2 = @{}
$ht2.Add('Marke','Red Bull')
$ht2
$ht2.kw = 500
$ht2
$ht2.Remove('kw')
$ht2

# Variable management
Get-Variable
Remove-Variable -Name arr2
Get-Variable
Clear-Variable -Name a
Get-Variable
Get-Command -Name *variable
Get-Command -Noun variable
