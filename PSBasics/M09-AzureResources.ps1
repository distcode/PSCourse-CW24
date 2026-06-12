# Install Az Modules
Find-Module Az 
Install-Module Az
Update-Module Az

# Sign in
Connect-AzAccount
Connect-AzAccount -Tenant 'TenantID'

# Check sign in
Get-AzContext
Get-AzSubscription
Select-AzSubscription -Subscription 'SubscriptionID'

# Create and manage Resource Groups
New-AzResourceGroup -Name 'rg-name' -Location 'location'
Get-AzResourceGroup 
Get-AzResourceGroup | Format-Table
Remove-AzResourceGroup -Name 'rg-name' -Force -AsJob

# Create and manage Virtual Network
Get-AzVirtualNetwork
Get-AzVirtualNetwork -ResourceGroupName 'rg-name'

New-AzVirtualNetwork -Name 'vnet-name' -ResourceGroupName 'rg-name' -Location 'location' -AddressPrefix '192.168.0.0/24'
$vnet = Get-AzVirtualNetwork -Name 'vnet-name' -ResourceGroupName 'rg-name'
Add-AzVirtualNetworkSubnetConfig -VirtualNetwork $vnet -Name 'subnet-name' -AddressPrefix '192.168.0.0/26'
Set-AzVirtualNetwork -VirtualNetwork $vnet    # or: $vnet | Set-AzVirtualNetwork

Remove-AzVirtualNetwork -Name 'vnet-name' -ResourceGroupName 'rg-name'

# VM

$location = 'eastus';
$rgname = 'RG-W365Env';
New-AzResourceGroup -Name $rgname -Location $location;

New-AzVirtualNetwork -Name 'VNet-Hub' -ResourceGroupName $rgname -Location $location -AddressPrefix '10.100.0.0/16';
$vnet = Get-AzVirtualNetwork -Name 'VNet-Hub' -ResourceGroupName $rgname;
Add-AzVirtualNetworkSubnetConfig -VirtualNetwork $vnet -Name 'sn-CloudPCs' -AddressPrefix '10.100.10.0/24';
Add-AzVirtualNetworkSubnetConfig -VirtualNetwork $vnet -Name 'sn-OnPremSim' -AddressPrefix '10.100.20.0/24';
Set-AzVirtualNetwork -VirtualNetwork $vnet;

$cred = New-Object -TypeName PSCredential -ArgumentList ('localadmin',(ConvertTo-SecureString 'Pa$$w0rd1234' -AsPlainText -Force));
New-AzVM -ResourceGroupName $rgname -Location $location `
         -Name opDC `
         -VirtualNetworkName $VNet.Name -SubnetName 'sn-OnPremSim' `
         -Credential $cred `
         -Size 'Standard_D2as_v5' `
         -PublicIpAddressName 'opDC-PubIP' `
         -Image 'Win2019Datacenter' `
         -OpenPorts @(3389,5986);
