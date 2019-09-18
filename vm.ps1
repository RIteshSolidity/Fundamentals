
$r = "vmfrompowershell"
$l = "West Europe"

# create a new resource group

       New-AzResourceGroup -Name $r -Location $l -Verbose

$pip = New-AzPublicIpAddress -Name pip01 -ResourceGroupName $r -Location $l -Sku Basic -AllocationMethod Static -IpAddressVersion IPv4 -Verbose

$subnetconfig = New-AzVirtualNetworkSubnetConfig -Name subnet01 -AddressPrefix 10.0.0.0/24 -Verbose

$vnet = New-AzVirtualNetwork -Name vnet01 -ResourceGroupName $r -Location $l -AddressPrefix 10.0.0.0/16 `
-Subnet $subnetconfig -Verbose

$nic = New-AzNetworkInterface -Name nic01 -ResourceGroupName $r -Location $l -Subnet $vnet.Subnets[0] -PublicIpAddress $pip -Force

$vm = New-AzVMConfig -VMName  vm01 -VMSize "Standard_A4" |
Set-AzVMOSDisk   -CreateOption FromImage |
Set-AzVMOperatingSystem -Windows -ComputerName vm01 -Credential (Get-credential) |
Set-AzVMSourceImage -PublisherName MicrosoftWindowsServer -Offer WindowsServer -Skus 2016-Datacenter -Version latest |
Add-AzVMNetworkInterface -Id $nic.Id -Primary 

New-AzVM -ResourceGroupName $r -Location $l -VM $vm -Verbose
