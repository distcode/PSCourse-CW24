
# Know current config
Get-NetIPConfiguration

Get-NetIPAddress
Get-NetIPAddress | Format-Table

Get-NetRoute | Where-Object { $_.DestinationPrefix -eq '0.0.0.0/0' }


# Set IP Address
New-NetIPAddress -InterfaceIndex 6 -IPAddress 10.202.0.12 -PrefixLength 24 -DefaultGateway 10.202.0.99 -AddressFamily IPv4

# Set DNS Config
Set-DnsClientServerAddress -InterfaceIndex 6 -ServerAddresses 10.202.0.11,1.1.1.1
Get-DnsClientServerAddress

# Change from static to dynamic addresses
## 1. Remove Default Gateway since is not done automatically in step 2
$defaultRoute =  Get-NetRoute | Where-Object {$_.DestinationPrefix -eq '0.0.0.0/0'}
$defaultRoute | Remove-NetRoute -Confirm:$false
## 2. Enable DHCP
Set-NetIPInterface -InterfaceIndex 6 -Dhcp Enabled
## 3. Reset DNS Config
Set-DnsClientServerAddress -InterfaceIndex 6 -ResetServerAddresses
