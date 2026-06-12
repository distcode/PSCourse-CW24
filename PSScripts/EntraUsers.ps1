
$students = Import-Csv .\Students.csv

$students

$htPasswordProfile = @{
    Password = 'Pa55w.rd9876!'
    ForceChangePasswordNextSignIn = $true
}

foreach ($student in $students) {

    New-MgUser -DisplayName "$($student.givenname) $($student.Surname)" `
            -UserPrincipalName "$($student.GivenName)@trg.dist.at" `
            -MailNickname $student.GivenName `
            -PasswordProfile $htPasswordProfile `
            -UserType 'Member' `
            -UsageLocation 'AT' `
            -AccountEnabled
}