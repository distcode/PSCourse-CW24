
# Creating a key
New-Item -Path HKCU:\Software -Name 'sWAT-PS' -ItemType Key
Get-ChildItem HKCU:\Software\

# mastering values
New-ItemProperty -Path HKCU:\Software\sWAT-PS\ -Name TlnAnzahl -PropertyType Banane
New-ItemProperty -Path HKCU:\Software\sWAT-PS\ -Name TlnAnzahl -PropertyType dword -Value 9

New-ItemProperty -Path HKCU:\Software\sWAT-PS\ -Name Level -PropertyType string -Value 'Basic'

Get-ItemProperty -Path HKCU:\Software\sWAT-PS\ -Name level
Get-ItemProperty -Path HKCU:\Software\sWAT-PS\ -Name level | Get-Member
(Get-ItemProperty -Path HKCU:\Software\sWAT-PS\ -Name level).Level

Get-ItemPropertyValue -PSPath HKCU:\Software\sWAT-PS\ -Name Level

Get-Item -Path HKCU:\Software\sWAT-PS\
Get-Item -Path HKCU:\Software\sWAT-PS\ | Get-Member
(Get-Item -Path HKCU:\Software\sWAT-PS\ ).GetValueNames()
(Get-Item -Path HKCU:\Software\sWAT-PS\ ).GetValue('tlnAnzahl')
(Get-Item -Path HKCU:\Software\sWAT-PS\ ).GetValueKind('tlnanzahl')

cd .\Software\sWAT-PS\
Set-ItemProperty -Path . -Name Level -Value Grundlagen
Get-ItemPropertyValue -Path . -Name level

cd HKCU:\Software
Remove-Item .\sWAT-PS\ -Force -Recurse



