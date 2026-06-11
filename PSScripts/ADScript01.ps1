

# Variables
$ou = 'ou=Hogwarts,dc=adatum,dc=com'
$secreatPWD = ConvertTo-SecureString -String 'Pa$$w0rd' -AsPlainText -Force

# OU Check
$ous = Get-ADOrganizationalUnit -filter *
if ( $ous.distinguishedName -notcontains $ou ) {
    New-ADOrganizationalUnit  -Path 'dc=adatum,dc=com' -Name 'Hogwarts'
    Write-Host "OU $OU wurde angelegt." -ForegroundColor Magenta
}

# Import User
$users = Import-Csv -Path .\Data\NewUsers1.csv

# New-ADUser
foreach ($usr in $users) {
    # User already exists?
    $samAccountName = $usr.givenname
    if ( (Get-ADUser -Filter *).samAccountname -contains $samAccountName ) {
        Write-host "User exists already." -ForegroundColor Cyan
        continue
    }
    
    $upn = "$($usr.givenname)@adatum.com"
    $givenname = $usr.givenname
    $surname = $usr.surname
    $name = "$givenname $surname"
    $dpt = $usr.department
    $desc = $usr.description

    try {
    New-ADUser -Path $ou `
               -Name $name `
               -SamAccountName $samAccountName `
               -UserPrincipalName $upn `
               -AccountPassword $secreatPWD `
               -Enabled $true `
               -GivenName $givenname `
               -Surname $surname `
               -Department $dpt `
               -Description $desc `
               -ErrorAction Stop
    }
    catch {
        "FEHLER: User $Name cannot be created."
        continue
    }
    Write-Host "User $name successfully created."
} 

