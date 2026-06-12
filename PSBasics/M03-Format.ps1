
# Format cmdlets
Get-Command -verb format

# Format-Table
Get-Service | Format-Table -Property Servicename,Starttype,Status
Get-Service | Format-Table -Property Servicename,Starttype,Status -RepeatHeader
Get-Service | Format-Table -Property Servicename,Starttype,Status -HideTableHeaders
Get-Service | Format-Table 
Get-Service | Format-Table -Wrap
$htSizeKB
$htSizeKBFT = $htSizeKB
$htSizeKBFT
Get-ChildItem C:\Windows\ -File | Format-Table -Property Name,length,$htSizeKBFT
$htSizeKBFT += @{ Format='n2' }
Get-ChildItem C:\Windows\ -File | Format-Table -Property Name,length,$htSizeKBFT
Get-ChildItem C:\Windows\ -File | Format-Table -Property Name,length,$htSizeKBFT | Get-Member

# Format-List
Get-ChildItem c:\windows -File | Select-Object -Property Name,Basename,Extension,Length
Get-ChildItem c:\windows -File | Select-Object -Property Name,Basename,Extension,Length,Isreadonly
Get-ChildItem c:\windows -File | Select-Object -Property Name,Basename,Extension,Length | Format-List
Get-ChildItem C:\windows\explorer.exe | Format-List -Property *

# Format-Wide
Get-ChildItem c:\windows -File | Select-Object -Property Name
Get-ChildItem c:\windows -File | Select-Object -Property Name | Format-Wide -Property Name
Get-ChildItem c:\windows -File | Select-Object -Property Name | Format-Wide -Property Name -Column 4
