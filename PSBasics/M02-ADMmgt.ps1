
# check Active Directory Module availability
Get-Module -ListAvailable -Name ActiveDirectory

# Install Module on Windows Server
Install-WindowsFeature -Name RSAT-AD-PowerShell
Get-WindowsFeature

# Get list of cmdlets offerb in Active Dicrectory Module
Get-Command -Module ActiveDirectory

# Explore Forest and Domain
Get-ADForest
Get-ADDomain

# Get list of AD resources
Get-ADOrganizationalUnit -Filter *
Get-ADOrganizationalUnit -Filter * | Format-Table

Get-ADUser -Filter *
Get-ADUser -Filter * -SearchBase 'ou=Detectives,dc=pstrg,dc=local'
Get-ADUser -Filter * -SearchBase 'ou=Detectives,dc=pstrg,dc=local' -SearchScope OneLevel

# Filter list of AD resources
Get-ADUser -Filter * -SearchBase 'ou=Detectives,dc=pstrg,dc=local' | Where-Object { $_.samaccountname -like 'm*' }
Get-ADUser -Filter { samaccountname -like 'm*'  } -SearchBase 'ou=Detectives,dc=pstrg,dc=local'

Get-ADGroup -Filter *
Get-ADGroup -Filter { samaccountname -like 'Domain*' }

# Get additional attributes
Get-ADUser -Filter * -SearchBase 'ou=Detectives,dc=pstrg,dc=local'
Get-ADUser -Filter * -SearchBase 'ou=Detectives,dc=pstrg,dc=local' | Format-Table -Property SAMAccountName,Department,City
Get-ADUser -Filter * -SearchBase 'ou=Detectives,dc=pstrg,dc=local' -Properties Department,City  | Format-Table -Property SAMAccountName,Department,City

# Create new user
New-ADUser -Path 'ou=Detectives,dc=pstrg,dc=local' -Name 'Salvo Montalbano' -SamAccountName salvo -Surname Montalbano -GivenName 'Salvo' -Country IT -UserPrincipalName 'salvo@pstrg.local'
Get-ADUser -Filter *
Get-ADUser -Identity salvo

# Set password and enable an account
$password = ConvertTo-SecureString -String 'Pa$$w0rd' -AsPlainText -Force
Set-ADAccountPassword -identity salvo -NewPassword $password
Enable-ADAccount -Identity salvo
Get-ADUser -Identity salvo

# Create new enabled user (with password)
New-ADUser -Path 'ou=Detectives,dc=pstrg,dc=local' -Name 'Hercules Poirot' -GivenName Hercules -Surname Poirot -UserPrincipalName 'hercules@pstrg.local' -SamAccountName hercules -AccountPassword $password -Enabled $true
Get-ADUser -Identity hercules

# Setting attributes
Set-ADUser -Identity mike -Company Hammer
Get-ADUser -Identity mike -Properties company
Set-ADUser -Identity mike -EmployeeID 'D01' -EmployeeNumber 2 -Employeetype CEO

$htEmployeeAttributes = @{ EmployeeID='D01'; EmployeeType='CEO'; EmployeeNumber=2  }
$htEmployeeAttributes
Set-ADUser -Identity mike -Replace $htEmployeeAttributes
Get-ADUser -Identity mike -Properties EmployeeID,EmployeeNumber,EmployeeType

# Groups in AD
Get-ADGroup -Filter *
New-ADGroup -Path 'ou=Detectives,dc=pstrg,dc=local' -Name Detectives -SamAccountName Detectives -GroupCategory Security -GroupScope Universal
Get-ADGroup -Identity Detectives

# Group membership
Add-ADGroupMember -Identity Detectives -Members Hercules
Get-ADGroupMember -Identity detectives
Remove-ADGroupMember -Identity Detectives -Members Hercules

# Adding multiple users to a single group
Get-ADUser -Filter * -SearchBase 'ou=Detectives,dc=pstrg,dc=local' 
Get-ADUser -Filter * -SearchBase 'ou=Detectives,dc=pstrg,dc=local' | Add-ADGroupMember -Identity Detectives # is not working !!!

get-help Add-ADGroupMember -ShowWindow
Get-Command -noun object

$myUsers = Get-ADUser -Filter * -SearchBase 'ou=Detectives,dc=pstrg,dc=local'
$myUsers | ForEach-Object -Process { Add-ADGroupMember -Identity Detectives -Members $_  } 

$myUsers | ForEach-Object -Process { Remove-ADGroupMember -Identity Detectives -Members $_  } 
$myUsers | ForEach-Object -Begin { $i = 0; 'Users werden der Gruppe hinzugefÃ¼gt ...' }  -Process { Remove-ADGroupMember -Identity Detectives -Members $_; $i++; $_.SamAccountname  } -End { "Es wurden $i User hinzugefügt." } 
$myUsers | ForEach-Object -Begin { $i = 0; 'Users werden der Gruppe hinzugefÃ¼gt ...' }  -Process { Add-ADGroupMember -Identity Detectives -Members $_; $i++; $_.SamAccountname  } -End { "Es wurden $i User hinzugefügt." } 

Get-ADUser -Identity salvo -Properties Memberof
Get-ADPrincipalGroupMembership -Identity salvo

# Search for special accounts
Search-ADAccount -AccountInactive
