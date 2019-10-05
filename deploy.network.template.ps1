param(
 [Parameter(Mandatory=$True)]
 [string]
 $deploymentName,

 [string]
 $templateFileName = "azuredeploy.network.json",

 [string]
 $templateParameterFileName = "azuredeploy.network.parameters.json"
)

#******************************************************************************
# Script body
# Execution begins here
#******************************************************************************
$ErrorActionPreference = "Stop"
$scriptDir = $PSScriptRoot + "\" + "ARM Templates\Master templates\"

# sign in
Write-Host "Logging in...";
Login-AzAccount;

$params = @{
	'Name' = $deploymentName
    'Location' = 'NorthEurope'
	'TemplateFile' = $scriptDir + $templateFileName
    'TemplateParameterFile' = $scriptDir + $templateParameterFileName }
	
# Start the deployment
Write-Host "Starting deployment...";
#New-AzResourceGroupDeployment @params
New-AzDeployment @params -Verbose