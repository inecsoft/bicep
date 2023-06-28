param env string = 'dev'
var storagePrefix= 'stor${resourceGroup().id}${uniqueString(resourceGroup().id)}'
param location string = resourceGroup().location
param adminUsername string = 'admin-user'
param uniqstr string = uniqueString(resourceGroup().id)

resource storageaccount 'Microsoft.Storage/storageAccounts@2021-02-01' = {
 name: '${storagePrefix}${env}'
 location: location
 kind: 'StorageV2'
 sku: {
 name: 'Premium_LRS'
 }
}

resource windowsVM 'Microsoft.Compute/virtualMachines@2020-12-01' = {
  name: '${storagePrefix}${env}'
  location: location
  properties: {
    hardwareProfile: {
      vmSize: 'Standard_B1ms'
    }
    osProfile: {
      computerName: 'computerName'
      adminUsername: adminUsername
      adminPassword: uniqstr
    }
    storageProfile: {
      imageReference: {
        publisher: 'MicrosoftWindowsServer'
        offer: 'WindowsServer'
        sku: '2012-R2-Datacenter' //'Windows 2019 Datacenter'
        version: 'latest'
      }
      osDisk: {
        name: 'name'
        caching: 'ReadWrite'
        createOption: 'FromImage'
      }
    }
    networkProfile: {
      networkInterfaces: [
        {
          id: 'id'
        }
      ]
    }
    diagnosticsProfile: {
      bootDiagnostics: {
        enabled: true
        storageUri:  'storageUri'
      }
    }
  }
}
