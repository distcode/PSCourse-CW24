
# Prepare environment
get-process p* | Select-Object ProcessName,Id,Handle,WorkingSet
1..3 | ForEach-Object -Process { notepad }

# redirect output
Get-Process Notepad
Get-Process Notepad > .\myProcesses.txt
Get-Content .\myProcesses.txt

Get-ChildItem hklm:\
Get-ChildItem hklm:\ > .\myReg.txt
.\myReg.txt
Get-ChildItem hklm:\ 1> .\myReg.txt 2> myRegError.txt
.\myRegError.txt
Get-ChildItem hklm:\ 2>&1 > .\myRegError.txt
.\myRegError.txt

get-help about_redirection -ShowWindow

# redirect output with cmdlet
Get-Process Notepad | Out-File -FilePath .\myProcesses.txt 
.\myProcesses.txt
Get-Process Notepad | Tee-Object -FilePath .\myProcesses.txt -Append 
.\myProcesses.txt
Get-Process Notepad | Tee-Object -FilePath .\myProcesses.txt -Append | Get-Member

# create csv files
Get-ChildItem C:\Windows\ -File | Select-Object -Property Name,Length,LastWritetime,Isreadonly
Get-ChildItem C:\Windows\ -File | Select-Object -Property Name,Length,LastWritetime,Isreadonly | Export-Csv -Path .\myFiles.csv 
.\myFiles.csv
Get-ChildItem C:\Windows\Logs\WindowsUpdate -File
Get-ChildItem | export-csv -Path .\myFiles.csv
.\myFiles.csv
Get-ChildItem C:\Windows\ -File | Select-Object -Property Name,Length,LastWritetime,Isreadonly | Export-Csv -Path .\myFiles.csv 
Get-ChildItem | Export-Csv -Path .\myFiles.csv -Append
.\myFiles.csv
Get-Content .\myFiles.csv
$myFiles = Import-Csv .\myFiles.csv
$myFiles
$myFiles[5]
$myFiles[5].isreadonly
$myFiles | Get-Member
$myFiles | Sort-Object name -Descending
$myFiles | Sort-Object length -Descending
$myFiles | Get-Member

# create xml files
Get-ChildItem C:\Windows\ -File | Select-Object -Property Name,Length,LastWritetime,Isreadonly | Export-Clixml -Path myFiles.xml
.\myFiles.xml
$myFiles = Import-Clixml -Path .\myFiles.csv
$myFiles = Import-Clixml -Path .\myFiles.xml
$myFiles
$myFiles | Sort-Object length -Descending
$myFiles | Get-Member

# create json files
Get-ChildItem C:\Windows\ -File | Select-Object -Property Name,Length,LastWritetime,Isreadonly | ConvertTo-Json 
Get-ChildItem C:\Windows\ -File | Select-Object -Property Name,Length,LastWritetime,Isreadonly | ConvertTo-Json | Out-File -FilePath .\myFiles.json
$myFiles = Get-Content .\myFiles.json 
$myFiles
$myFiles | ConvertFrom-Json
$myFiles = Get-Content .\myFiles.json | ConvertFrom-Json
$myFiles

# adding content to text files
Set-Content -Value 'Das ist die erste Zeile.' -Path .\myInformation.txt
Get-Content -Path .\myInformation.txt
Set-Content -Value 'Das ist die zweite Zeile.' -Path .\myInformation.txt
Get-Content -Path .\myInformation.txt
Set-Content -Value 'Das ist die erste Zeile.' -Path .\myInformation.txt
Add-Content -Value 'Das ist die zweite Zeile.' -Path .\myInformation.txt
Get-Content -Path .\myInformation.txt

Get-Content .\myInformation.txt -Wait
3..10 | ForEach-Object -Process { Add-Content -Value "Das ist die $_. Zeile." -path .\myInformation.txt ; Start-Sleep -Seconds 2 }

# creating html files
Get-ChildItem C:\Windows\ -File | ConvertTo-Html -Property Name,LastWriteTime,IsReadonly,Length
Get-ChildItem C:\Windows\ -File | ConvertTo-Html -Property Name,LastWriteTime,IsReadonly,Length | Out-File -FilePath .\myFiles.html
.\myFiles.html

