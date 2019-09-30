param(
 [Parameter(Mandatory=$True)]
 [string]
 $deploymentName,

 [Parameter(Mandatory=$True)]
 [string]
 $localIpAddress,

 [Parameter(Mandatory=$True)]
 [string]
 $presharedkey,

 [string]
 $templateFileName = "azuredeploy.onpremnetwork.json",

 [string]
 $templateParameterFileName = "azuredeploy.onpremnetwork.parameters.json"
)

#******************************************************************************
# Script body
# Execution begins here
#******************************************************************************
$ErrorActionPreference = "Stop"
$scriptDir = $PSScriptRoot + "\"

# Modify parameters to securestring
$localNetworkGatewayIpAddress = ConvertTo-SecureString $localIpAddress -AsPlainText -Force
$sharedKey = ConvertTo-SecureString $presharedkey -AsPlainText -Force

# sign in
Write-Host "Logging in...";
Login-AzAccount;

$params = @{
	'Name' = $deploymentName
    'Location' = 'NorthEurope'
    'localNetworkGatewayIpAddress' = $localNetworkGatewayIpAddress
    'sharedKey' = $sharedKey
	'TemplateFile' = $scriptDir + $templateFileName
    'TemplateParameterFile' = $scriptDir + $templateParameterFileName }
	
# Start the deployment
Write-Host "Starting deployment...";
#New-AzResourceGroupDeployment @params
New-AzDeployment @params