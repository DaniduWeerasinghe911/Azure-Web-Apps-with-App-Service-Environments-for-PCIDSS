
//This solution is deploying one SQL server and a DataFactory
targetScope = 'subscription'

@description('Prefix value which will be prepended to all resource names.')
@minLength(2)
@maxLength(4)
param companyPrefix string

@description('Optional. Geo-location codes for resources.')
param geoLocationCodes object = {
  australiacentral: 'acl'
  australiacentral2: 'acl2'
  australiaeast: 'ae'
  australiasoutheast: 'ase'
  brazilsouth: 'brs'
  centraluseuap: 'ccy'
  canadacentral: 'cnc'
  canadaeast: 'cne'
  centralus: 'cus'
  eastasia: 'ea'
  eastus2euap: 'ecy'
  eastus: 'eus'
  eastus2: 'eus2'
  francecentral: 'frc'
  francesouth: 'frs'
  germanynorth: 'gn'
  germanywestcentral: 'gwc'
  centralindia: 'inc'
  southindia: 'ins'
  westindia: 'inw'
  japaneast: 'jpe'
  japanwest: 'jpw'
  koreacentral: 'krc'
  koreasouth: 'krs'
  northcentralus: 'ncus'
  northeurope: 'ne'
  norwayeast: 'nwe'
  norwaywest: 'nww'
  southafricanorth: 'san'
  southafricawest: 'saw'
  southcentralus: 'scus'
  swedencentral: 'sdc'
  swedensouth: 'sds'
  southeastasia: 'sea'
  switzerlandnorth: 'szn'
  switzerlandwest: 'szw'
  uaecentral: 'uac'
  uaenorth: 'uan'
  uksouth: 'uks'
  ukwest: 'ukw'
  westcentralus: 'wcus'
  westeurope: 'we'
  westus: 'wus'
  westus2: 'wus2'
  usdodcentral: 'udc'
  usdodeast: 'ude'
  usgovarizona: 'uga'
  usgoviowa: 'ugi'
  usgovtexas: 'ugt'
  usgovvirginia: 'ugv'
  chinanorth: 'bjb'
  chinanorth2: 'bjb2'
  chinaeast: 'sha'
  chinaeast2: 'sha2'
  germanycentral: 'gec'
  germanynortheast: 'gne'
}

@description('Optional. The geo-location identifier used for all resources.')
@minLength(2)
@maxLength(4)
param locationIdentifier string = contains(geoLocationCodes, location) ? '${geoLocationCodes[toLower(location)]}' : location

@description('Optional. Environment resources are being deployed into.')
param deploymentEnvironment string = 'shared'

@description('The RgName name.')
param rgName string

@description('App Service Plan Name for the deployment')
param appServicePlanName string

@description('vault webapp name')
param webAppName string

@description('Front Door header')
param frontDoorHeader string

@description('Application Insights ID')
param diagnosticAppInsightId string = ''

@description('App Service Plan Configuration')
param aspConfig object

@description('The geo-location where the resource lives.')
param location string

@description('Optional. Resource tags.')
@metadata({
  doc: 'https://docs.microsoft.com/en-us/azure/azure-resource-manager/management/tag-resources?tabs=bicep#arm-templates'
  example: {
    tagKey: 'string'
  }
})
param tags object = {}

@description('Optional. Storage account resource id. Only required if enableDiagnostics is set to true.')
param diagnosticStorageAccountId string = ''

@description('Optional. Log analytics workspace resource id. Only required if enableDiagnostics is set to true.')
param diagnosticLogAnalyticsWorkspaceId string = ''

@description('App Service Environment vnet ID')
param appServiceEnvVnetId string

@description('App Service Environment Subnet Name')
param appServiceEnvsubnetName string

@description('App Service Environment Name')
param webAppServiceEnvName string



resource rg 'Microsoft.Resources/resourceGroups@2023-07-01' = {
  name: rgName
  location: location
  tags:tags
}

module web 'webapp.main.bicep' = {
  name: 'deploy_web_app'
  params: {
    location:location
    appServicePlanName: appServicePlanName
    aspConfig: aspConfig
    frontDoorHeader: frontDoorHeader
    rgName: rgName
    webAppName: webAppName
    diagnosticAppInsightId:diagnosticAppInsightId
    diagnosticLogAnalyticsId:diagnosticLogAnalyticsWorkspaceId
    diagnosticStorageAccountId:diagnosticStorageAccountId
    tags:tags
    appServiceEnvsubnetName:appServiceEnvsubnetName
    appServiceEnvVnetId:appServiceEnvVnetId
    webAppServiceEnvName:webAppServiceEnvName

  }
}
