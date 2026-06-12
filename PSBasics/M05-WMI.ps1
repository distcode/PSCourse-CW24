
# WMI

# WMI - exploring Classes
Get-CimClass 
Get-CimClass -Namespace root/Hardware/ms_409

Get-CimClass -ClassName Win32_Group
Get-CimClass -ClassName Win32_Group | Select-Object -ExpandProperty CimClassProperties | Format-Table
Get-CimClass -ClassName Win32_Group | Select-Object -ExpandProperty CimClassmethods | Format-Table
(Get-CimClass -ClassName Win32_Group).CimClassmethods | Format-Table

# WMI - quering instances
Get-CimInstance -ClassName Win32_Group
Get-CimInstance -ClassName Win32_Group | Where-Object { $_.Name -eq 'Power Users' }
Get-CimInstance -ClassName Win32_Group | Where-Object { $_.Name -eq 'Power Users' } | Format-List -Property *

Get-CimInstance -ClassName Win32_NetworkAdapter 
Get-CimInstance -ClassName Win32_NetworkAdapter | Where-Object { $_.DeviceID -eq 1 } | Format-List *
(Get-CimInstance -ClassName Win32_NetworkAdapter | Where-Object { $_.DeviceID -eq 1 }).MAcaddress

# WMI - quering with WQL
# more about WQL: get-help about_wql
Get-CimInstance -Query " Select * From Win32_Group  "
Get-CimInstance -Query " Select * From Win32_Group Where Name like 'Power%' "
Get-WmiObject -Class win32_group

# WMI - remoting
Get-CimInstance -ClassName Win32_Group -ComputerName dc1

$cimsession = New-CimSession -ComputerName dc1


Get-CimInstance -ClassName Win32_NetworkAdapter -CimSession $cimsession
Remove-CimSession -ServerName dc1

# WMI - invoking methods
Get-CimInstance -ClassName Win32_Product
$myProduct = Get-CimInstance -ClassName Win32_Product | Where-Object { $_.name -like '7-*' }
$myProduct
$myProduct | Get-Member

$myProduct | Invoke-CimMethod -MethodName Uninstall 
Get-CimInstance -ClassName Win32_Product
