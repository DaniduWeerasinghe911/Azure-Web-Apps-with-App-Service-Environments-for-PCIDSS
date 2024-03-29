using './main.bicep'

param companyPrefix = 'company'
param location = 'australiaeast'
param geoLocationCodes = {
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
param locationIdentifier = 'ae'
param deploymentEnvironment = 'prod'

param rgName = '${companyPrefix}-${locationIdentifier}-${deploymentEnvironment}-workloads-rg'
param appServicePlanName = '${companyPrefix}-${locationIdentifier}-${deploymentEnvironment}-asp'
param webAppName = '${companyPrefix}-${locationIdentifier}-${deploymentEnvironment}-app'
param frontDoorHeader = ''
param diagnosticAppInsightId = ''
param aspConfig = {
  skuCapacity: 1
  skuName: 'I1v2'
  skutier: 'IsolatedV2'
  kind: 'windows'
}
param tags = {
  Environment: 'Prod'
  WorkloadName: ''
  BusinessCriticality: 'High'
  BusinessOwner: ''
  BusinessUnit: ''
}
param diagnosticStorageAccountId = ''
param diagnosticLogAnalyticsWorkspaceId = ''
param appServiceEnvsubnetName = ''
param appServiceEnvVnetId = ''
param webAppServiceEnvName = ''
