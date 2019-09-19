New-AzResourceGroup -Name vaultdemo -Location westeurope -Verbose
$keyvault - New-AzKeyVault -Name "thursdayvault" -ResourceGroupName vaultdemo -Location westeurope -EnabledForDeployment -EnabledFo
rTemplateDeployment -EnabledForDiskEncryption -EnableSoftDelete -EnablePurgeProtection -Sku Standard -Verbose
$keyvault = New-AzKeyVault -Name "thursdayvault" -ResourceGroupName vaultdemo -Location westeurope -EnabledForDeployment -EnabledFo
rTemplateDeployment -EnabledForDiskEncryption -EnableSoftDelete -EnablePurgeProtection -Sku Standard -Verbose
$keyvault
$app = New-AzADApplication -DisplayName "vaultdemothursday" -IdentifierUris "http://vaultdemothursday" -Password (ConvertTo-SecureS
tring -String Password -AsPlainText -Force)
$sp = New-AzADServicePrincipal -ApplicationId $app.ApplicationId.Guid -DisplayName "vaultdemothursday" -Scope "/subscriptions/f0bb4
697-5b29-46cc-8fc9-a4e5ac7800dc" -Role Owner -Verbose
$sp.ApplicationId
$sp.Id
Set-AzKeyVaultSecret -VaultName thursdayvault -Name "mysecretid" -SecretValue "1234" -Verbose
Set-AzKeyVaultSecret -VaultName thursdayvault -Name "mysecretid" -SecretValue (ConvertTo-SecureString -String 1234 -AsPlainText -Fo
rce) -Verbose
Set-AzKeyVaultSecret -VaultName thursdayvault -Name "mysecretid" -SecretValue (ConvertTo-SecureString -String 1234 -AsPlainText -Fo
rce)  -Debug
Set-AzKeyVaultSecret -VaultName thursdayvault -Name "mysecretid" -SecretValue (ConvertTo-SecureString -String 1234 -AsPlainText -Fo
rce)  -Verbose
Get-AzKeyVaultSecret -VaultName thursdayvault -Name mysecretid 
(Get-AzKeyVaultSecret -VaultName thursdayvault -Name mysecretid).SecretValueText
