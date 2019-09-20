New-AzResourceGroupDeployment -Name "FirstDeployment" -ResourceGroupName testResourceGroup -Mode Incremental -TemplateFile "C:\Ritesh\M\ll.json"  -storageAccountName "werwrewer" -Verbose

New-AzResourceGroupDeployment -Name "FirstDeployment" -ResourceGroupName testResourceGroup -Mode Incremental -TemplateFile "C:\Ritesh\M\ll.json"  -TemplateParameterFile "C:\Users\Ritesh\source\repos\AzureResourceGroup1\AzureResourceGroup1\azuredeploy.parameters.json" -Verbose
