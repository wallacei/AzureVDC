param(
 [Parameter(Mandatory=$True)]
 [string]
 $deploymentName,

 [Parameter(Mandatory=$True)]
 [string]
 $StorageAccountName,

 [string]
 $templateFileName = "azuredeploy.firewalls.json",

 [string]
 $templateParameterFileName = "azuredeploy.firewalls.parameters.json"
)

#******************************************************************************
# Script body
# Execution begins here
#******************************************************************************
$ErrorActionPreference = "Stop"
$scriptDir = $PSScriptRoot + "\" + "ARM Templates\Master templates\"

# Modify parameters to securestring
$pfSenseStorageAccountName = ConvertTo-SecureString $StorageAccountName -AsPlainText -Force

# sign in
Write-Host "Logging in...";
Login-AzAccount;

$params = @{
	'Name' = $deploymentName
    'Location' = 'NorthEurope'
    'pfSenseStorageAccountName' = $pfSenseStorageAccountName
	'TemplateFile' = $scriptDir + $templateFileName
    'TemplateParameterFile' = $scriptDir + $templateParameterFileName }
	
# Start the deployment
Write-Host "Starting deployment...";
#New-AzResourceGroupDeployment @params
New-AzDeployment @params