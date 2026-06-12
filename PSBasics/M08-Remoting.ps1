
# Remoting

# Enabling RS Remoting
Enable-PSRemoting

# investigate endpoints
Get-PSSessionConfiguration
Get-PSSessionConfiguration | Format-Table
Get-PSSessionConfiguration -ConfigurationName microsoft.powershell | Format-List *

Set-PSSessionConfiguration -Name microsoft.powershell -ShowSecurityDescriptorUI

Disable-PSRemoting
Set-PSSessionConfiguration -Name microsoft.powershell -ShowSecurityDescriptorUI

Enable-PSRemoting

# Remoting - invoking remote commands
Invoke-Command -ComputerName dc1 -ScriptBlock { Get-Process w* }
Get-Process wininit | Get-Member
Invoke-Command -ComputerName dc1 -ScriptBlock { Get-Process w* }
Invoke-Command -ComputerName dc1 -ScriptBlock { Get-Process w* } | Get-Member

## one:many remoting
Invoke-Command -ComputerName dc1 -ScriptBlock { Get-Process w* }
Invoke-Command -ComputerName dc1,srv1 -ScriptBlock { Get-Process w* }

## executing script remotly
Invoke-Command -ComputerName dc1 -FilePath C:\PSScripts\Script01.ps1
Invoke-Command -ComputerName dc1,cl1 -FilePath C:\PSScripts\Script01.ps1

## ad-hoc sessions
Invoke-Command -ComputerName dc1 -ScriptBlock { $a = 100 }
Invoke-Command -ComputerName dc1 -ScriptBlock { $a * 2 }
Invoke-Command -ComputerName dc1 -ScriptBlock { Get-Process w* }

## permanent sessions
$dc1session = New-PSSession -ComputerName dc1
$dc1session
Get-PSSession
Invoke-Command -Session $dc1session -ScriptBlock { $a = 100 }
Invoke-Command -Session $dc1session -ScriptBlock { $a * 2 }
Get-PSSession
Remove-PSSession -Session $dc1session
Get-PSSession
$dc1session
Remove-Variable dc1session
$mysessions = New-PSSession -ComputerName dc1,cl1
$mysessions
Invoke-Command -Session $mysessions -ScriptBlock { $a = (Get-Random -Minimum 1 -Maximum 50) }
Invoke-Command -Session $mysessions -ScriptBlock { $a }
Invoke-Command -Session $mysessions -ScriptBlock { "$($env:computername): $a" }
Remove-PSSession -Session $mysessions
Remove-Variable mysessions

$dc1session = New-PSSession -ComputerName dc1
Get-PSSession
Get-Command -noun pssession

# disconnecting and reconnecting a session
Disconnect-PSSession -Session $dc1session

Get-PSSession -ComputerName dc1
Get-PSSession -ComputerName dc1 -Name WinRM1
$dc1sessionagain = Connect-PSSession -Session (Get-PSSession -ComputerName dc1 -Name WinRM1)
$dc1sessionagain

# remote shell
Enter-PSSession -ComputerName dc1
    cd \
    md PSRemoting
    ls
    Get-Service b*
Exit-PSSession

Enter-PSSession -Session $dc1sessionagain
    cd \
    $a = 2000
    exit
Enter-PSSession -Session $dc1sessionagain
    $a
    exit

# implicit remoting
$dc1session = New-PSSession -ComputerName dc1
$dc1session
Import-Module -name ActiveDirectory # not working if RSAT are not installed ...
Import-Module -name ActiveDirectory -PSSession $dc1session
Get-Module
Get-ADUser -Filter *
Get-Module
# Proxy functions are created
(Get-Command -name Get-ADUser ).definition
