@secure()
param extensions_enablevmAccess_username string

@secure()
param extensions_enablevmAccess_password string

@secure()
param extensions_enablevmAccess_ssh_key string

@secure()
param extensions_enablevmAccess_reset_ssh string

@secure()
param extensions_enablevmAccess_remove_user string

@secure()
param extensions_enablevmAccess_expiration string

param adminUsername string = 'bharatomni'
// param vaults_kv_bo_platform_name string = 'kv-bo-sandbox-westus'         // westus2 — 
// param virtualMachines_bo_platform_vm_name string = 'bo-sandbox-vm-westus' // westus2 — 
// param sshPublicKeys_bo_platform_vm_key_name string = 'bo-sandbox-vm-westus_key' // westus2 — 
// param publicIPAddresses_bo_platform_vm_ip_name string = 'bo-sandbox-vm-westus-ip' // westus2 — 
// param virtualNetworks_bo_platform_vm_vnet_name string = 'bo-sandbox-vm-westus-vnet' // westus2 — 
// param networkInterfaces_bo_platform_vm127_z2_name string = 'bo-sandbox-vm-westus_z2' // westus2 — 
// param networkWatchers_NetworkWatcher_westus2_name string = 'NetworkWatcher_westus2'   // westus2 — 
// param networkSecurityGroups_bo_sandbox_vm_westus_nsg_name string = 'bo-sandbox-vm-westus-nsg' // westus2 — 
param virtualMachines_bo_platform_vm_india_name string = 'bo-sandbox-vm-india'
param publicIPAddresses_bo_platform_vm_india_ip_name string = 'bo-sandbox-vm-india-ip'
param virtualNetworks_bo_platform_vm_india_vnet_name string = 'bo-sandbox-vm-india-vnet'
param networkWatchers_NetworkWatcher_centralindia_name string = 'NetworkWatcher_centralindia'
param networkInterfaces_bo_platform_vm_india632_z1_name string = 'bo-sandbox-vm-india_z1'
param networkSecurityGroups_bo_platform_vm_india_nsg_name string = 'bo-sandbox-vm-india-nsg'


/*
// ── SSH Public Key (westus2)
resource sshPublicKeys_bo_platform_vm_key_name_resource 'Microsoft.Compute/sshPublicKeys@2025-11-01' = {
  name: sshPublicKeys_bo_platform_vm_key_name
  location: 'westus2'
  properties: {
    publicKey: 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDV8gUdgmkbS276dQIV+WEnl9B8daQXJ1Bj6g0ePphVUg5K04vHmY5n7luUyszcwTr3Xw7plKH8w8KNe+/IL6adW2btCkLTNtsD4xA2xj08YmkAfy1QQTYj12rllxcn+bbsp+WNcbXr5hE4f5AsmeiwSPOdoVqRrj0d+qdAZAcGWOTDvRf+z1goovYX/P+qqqqxct/zU+W0RghMNMWYnupS02JWNV6zCUwT0iDpNOys0FHE5/0VSHf9XcPPLAMZ7S/9CUo7zYqvS/1gNPbDZwo89Ns31Mj+OSS5NEcbdpUxxOGgVXrCgT9WQ6DIux21oYMsJuWAgxt2GDrDLeNXuX68oO8SdZndL4y+bkwmN/O6b6btQa3p43+c2lgOMWTgavPJY0U0ERoDAk0qx+bh8sAFb+T7jmcABkiIOUiV8A6hOhCyW6mkNUQMxlu2zzP2AiEDYeDXNOxQbnPqcAopfHVIeD53T47xQMCM6ClBpt7M2TDHcJ/F6tJWUEGx3TN8I9E= generated-by-azure'
  }
}

// ── Key Vault (westus2)
resource vaults_kv_bo_platform_name_resource 'Microsoft.KeyVault/vaults@2023-07-01' = {
  name: vaults_kv_bo_platform_name
  location: 'westus2'
  properties: {
    sku: {
      family: 'A'
      name: 'standard'
    }
    tenantId: 'e3a4cbad-dc44-4d51-9a85-b9a62d3cfc94'
    accessPolicies: []
    enabledForDeployment: true
    enabledForDiskEncryption: false
    enabledForTemplateDeployment: false
    enableSoftDelete: true
    softDeleteRetentionInDays: 90
    enableRbacAuthorization: true
    vaultUri: 'https://${vaults_kv_bo_platform_name}.${environment().suffixes.keyvaultDns}/'
    provisioningState: 'Succeeded'
    publicNetworkAccess: 'Enabled'
  }
}

// ── West US NSG (westus2)
resource networkSecurityGroups_bo_sandbox_vm_westus_nsg_name_resource 'Microsoft.Network/networkSecurityGroups@2025-05-01' = {
  name: networkSecurityGroups_bo_sandbox_vm_westus_nsg_name
  location: 'westus2'
  properties: {
    securityRules: []
  }
}

// ── NSG Security Rules — West US NSG (westus2)
resource networkSecurityGroups_bo_sandbox_vm_westus_nsg_name_SSH 'Microsoft.Network/networkSecurityGroups/securityRules@2025-05-01' = {
  parent: networkSecurityGroups_bo_sandbox_vm_westus_nsg_name_resource
  name: 'SSH'
  properties: {
    protocol: 'TCP'
    sourcePortRange: '*'
    destinationPortRange: '22'
    sourceAddressPrefix: '*'
    destinationAddressPrefix: '*'
    access: 'Allow'
    priority: 300
    direction: 'Inbound'
    sourcePortRanges: []
    destinationPortRanges: []
    sourceAddressPrefixes: []
    destinationAddressPrefixes: []
  }
}

resource networkSecurityGroups_bo_sandbox_vm_westus_nsg_name_HTTPS 'Microsoft.Network/networkSecurityGroups/securityRules@2025-05-01' = {
  parent: networkSecurityGroups_bo_sandbox_vm_westus_nsg_name_resource
  name: 'HTTPS'
  properties: {
    protocol: 'TCP'
    sourcePortRange: '*'
    destinationPortRange: '443'
    sourceAddressPrefix: '*'
    destinationAddressPrefix: '*'
    access: 'Allow'
    priority: 320
    direction: 'Inbound'
    sourcePortRanges: []
    destinationPortRanges: []
    sourceAddressPrefixes: []
    destinationAddressPrefixes: []
  }
}

resource networkSecurityGroups_bo_sandbox_vm_westus_nsg_name_client_portal_http 'Microsoft.Network/networkSecurityGroups/securityRules@2025-05-01' = {
  parent: networkSecurityGroups_bo_sandbox_vm_westus_nsg_name_resource
  name: 'client-portal-http'
  properties: {
    protocol: 'TCP'
    sourcePortRange: '*'
    destinationPortRange: '5173'
    sourceAddressPrefix: '*'
    destinationAddressPrefix: '*'
    access: 'Allow'
    priority: 330
    direction: 'Inbound'
    sourcePortRanges: []
    destinationPortRanges: []
    sourceAddressPrefixes: []
    destinationAddressPrefixes: []
  }
}

// ── Network Watcher (westus2)
resource networkWatchers_NetworkWatcher_westus2_name_resource 'Microsoft.Network/networkWatchers@2025-05-01' = {
  name: networkWatchers_NetworkWatcher_westus2_name
  location: 'westus2'
  properties: {}
}

// ── Public IP (westus2) 
resource publicIPAddresses_bo_platform_vm_ip_name_resource 'Microsoft.Network/publicIPAddresses@2025-05-01' = {
  name: publicIPAddresses_bo_platform_vm_ip_name
  location: 'westus2'
  sku: {
    name: 'Standard'
    tier: 'Regional'
  }
  zones: [
    '2'
  ]
  properties: {
    ipAddress: '74.179.82.188'
    publicIPAddressVersion: 'IPv4'
    publicIPAllocationMethod: 'Static'
    idleTimeoutInMinutes: 4
    ipTags: []
    ddosSettings: {
      protectionMode: 'VirtualNetworkInherited'
    }
  }
}

// ── Virtual Network (westus2)
resource virtualNetworks_bo_platform_vm_vnet_name_resource 'Microsoft.Network/virtualNetworks@2025-05-01' = {
  name: virtualNetworks_bo_platform_vm_vnet_name
  location: 'westus2'
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.0.0.0/16'
      ]
    }
    privateEndpointVNetPolicies: 'Disabled'
    virtualNetworkPeerings: []
    enableDdosProtection: false
  }
}

// ── Subnet (westus2 VNet)
resource virtualNetworks_bo_platform_vm_vnet_name_default 'Microsoft.Network/virtualNetworks/subnets@2025-05-01' = {
  parent: virtualNetworks_bo_platform_vm_vnet_name_resource
  name: 'default'
  properties: {
    addressPrefix: '10.0.0.0/24'
    delegations: []
    privateEndpointNetworkPolicies: 'Disabled'
    privateLinkServiceNetworkPolicies: 'Enabled'
  }
}

// ── Network Interface (westus2)
resource networkInterfaces_bo_platform_vm127_z2_name_resource 'Microsoft.Network/networkInterfaces@2025-05-01' = {
  name: networkInterfaces_bo_platform_vm127_z2_name
  location: 'westus2'
  properties: {
    ipConfigurations: [
      {
        name: 'ipconfig1'
        properties: {
          privateIPAddress: '10.0.0.4'
          privateIPAllocationMethod: 'Dynamic'
          publicIPAddress: {
            id: publicIPAddresses_bo_platform_vm_ip_name_resource.id
            properties: {
              deleteOption: 'Detach'
            }
          }
          subnet: {
            id: virtualNetworks_bo_platform_vm_vnet_name_default.id
          }
          primary: true
          privateIPAddressVersion: 'IPv4'
        }
      }
    ]
    dnsSettings: {
      dnsServers: []
    }
    enableAcceleratedNetworking: true
    enableIPForwarding: false
    disableTcpStateTracking: false
    networkSecurityGroup: {
      id: networkSecurityGroups_bo_sandbox_vm_westus_nsg_name_resource.id
    }
    nicType: 'Standard'
    auxiliaryMode: 'None'
    auxiliarySku: 'None'
  }
}

// ── Virtual Machine (westus2)
resource virtualMachines_bo_platform_vm_name_resource 'Microsoft.Compute/virtualMachines@2025-11-01' = {
  name: virtualMachines_bo_platform_vm_name
  location: 'westus2'
  zones: [
    '2'
  ]
  properties: {
    hardwareProfile: {
      vmSize: 'Standard_D2s_v3'
    }
    additionalCapabilities: {
      hibernationEnabled: false
    }
    storageProfile: {
      imageReference: {
        publisher: 'canonical'
        offer: 'ubuntu-24_04-lts'
        sku: 'server'
        version: 'latest'
      }
      osDisk: {
        osType: 'Linux'
        name: '${virtualMachines_bo_platform_vm_name}_disk1_fe2d2a4cd1df40b4823d7f475fc31fd2'
        createOption: 'FromImage'
        caching: 'ReadWrite'
        managedDisk: {
          storageAccountType: 'Premium_LRS'
        }
        deleteOption: 'Delete'
        diskSizeGB: 30
      }
      dataDisks: []
      diskControllerType: 'SCSI'
    }
    osProfile: {
      computerName: virtualMachines_bo_platform_vm_name
      adminUsername: adminUsername
      linuxConfiguration: {
        disablePasswordAuthentication: true
        ssh: {
          publicKeys: [
            {
              path: '/home/${adminUsername}/.ssh/authorized_keys'
              keyData: extensions_enablevmAccess_ssh_key
            }
          ]
        }
        provisionVMAgent: true
        patchSettings: {
          patchMode: 'ImageDefault'
          assessmentMode: 'ImageDefault'
        }
      }
      secrets: []
      allowExtensionOperations: true
      // requireGuestProvisionSignal: true  // requires Microsoft.Compute/Agentless feature —  
    }
    securityProfile: {
      uefiSettings: {
        secureBootEnabled: true
        vTpmEnabled: true
      }
      securityType: 'TrustedLaunch'
    }
    networkProfile: {
      networkInterfaces: [
        {
          id: networkInterfaces_bo_platform_vm127_z2_name_resource.id
          properties: {
            deleteOption: 'Detach'
          }
        }
      ]
    }
    diagnosticsProfile: {
      bootDiagnostics: {
        enabled: true
      }
    }
  }
}
*/

// ── Network Security Group — India
resource networkSecurityGroups_bo_platform_vm_india_nsg_name_resource 'Microsoft.Network/networkSecurityGroups@2025-05-01' = {
  name: networkSecurityGroups_bo_platform_vm_india_nsg_name
  location: 'centralindia'
  properties: {
    securityRules: []
  }
}

// ── NSG Security Rules — India NSG
resource networkSecurityGroups_bo_platform_vm_india_nsg_name_SSH 'Microsoft.Network/networkSecurityGroups/securityRules@2025-05-01' = {
  parent: networkSecurityGroups_bo_platform_vm_india_nsg_name_resource
  name: 'SSH'
  properties: {
    protocol: 'TCP'
    sourcePortRange: '*'
    destinationPortRange: '22'
    sourceAddressPrefix: '*'
    destinationAddressPrefix: '*'
    access: 'Allow'
    priority: 300
    direction: 'Inbound'
    sourcePortRanges: []
    destinationPortRanges: []
    sourceAddressPrefixes: []
    destinationAddressPrefixes: []
  }
}

resource networkSecurityGroups_bo_platform_vm_india_nsg_name_HTTPS 'Microsoft.Network/networkSecurityGroups/securityRules@2025-05-01' = {
  parent: networkSecurityGroups_bo_platform_vm_india_nsg_name_resource
  name: 'HTTPS'
  properties: {
    protocol: 'TCP'
    sourcePortRange: '*'
    destinationPortRange: '443'
    sourceAddressPrefix: '*'
    destinationAddressPrefix: '*'
    access: 'Allow'
    priority: 320
    direction: 'Inbound'
    sourcePortRanges: []
    destinationPortRanges: []
    sourceAddressPrefixes: []
    destinationAddressPrefixes: []
  }
}

resource networkSecurityGroups_bo_platform_vm_india_nsg_name_HTTP 'Microsoft.Network/networkSecurityGroups/securityRules@2025-05-01' = {
  parent: networkSecurityGroups_bo_platform_vm_india_nsg_name_resource
  name: 'HTTP'
  properties: {
    protocol: 'TCP'
    sourcePortRange: '*'
    destinationPortRange: '80'
    sourceAddressPrefix: '*'
    destinationAddressPrefix: '*'
    access: 'Allow'
    priority: 340
    direction: 'Inbound'
    sourcePortRanges: []
    destinationPortRanges: []
    sourceAddressPrefixes: []
    destinationAddressPrefixes: []
  }
}

resource networkSecurityGroups_bo_platform_vm_india_nsg_name_service_provider_platform 'Microsoft.Network/networkSecurityGroups/securityRules@2025-05-01' = {
  parent: networkSecurityGroups_bo_platform_vm_india_nsg_name_resource
  name: 'service-provider-platform'
  properties: {
    protocol: 'TCP'
    sourcePortRange: '*'
    destinationPortRange: '8080'
    sourceAddressPrefix: '*'
    destinationAddressPrefix: '*'
    access: 'Allow'
    priority: 350
    direction: 'Inbound'
    sourcePortRanges: []
    destinationPortRanges: []
    sourceAddressPrefixes: []
    destinationAddressPrefixes: []
  }
}

resource networkSecurityGroups_bo_platform_vm_india_nsg_name_client_portal_app 'Microsoft.Network/networkSecurityGroups/securityRules@2025-05-01' = {
  parent: networkSecurityGroups_bo_platform_vm_india_nsg_name_resource
  name: 'client-portal-app'
  properties: {
    protocol: '*'
    sourcePortRange: '*'
    destinationPortRange: '5173'
    sourceAddressPrefix: '*'
    destinationAddressPrefix: '*'
    access: 'Allow'
    priority: 360
    direction: 'Inbound'
    sourcePortRanges: []
    destinationPortRanges: []
    sourceAddressPrefixes: []
    destinationAddressPrefixes: []
  }
}

resource networkSecurityGroups_bo_platform_vm_india_nsg_name_admin_portal 'Microsoft.Network/networkSecurityGroups/securityRules@2025-05-01' = {
  parent: networkSecurityGroups_bo_platform_vm_india_nsg_name_resource
  name: 'admin-portal'
  properties: {
    protocol: '*'
    sourcePortRange: '*'
    destinationPortRange: '8081'
    sourceAddressPrefix: '*'
    destinationAddressPrefix: '*'
    access: 'Allow'
    priority: 370
    direction: 'Inbound'
    sourcePortRanges: []
    destinationPortRanges: []
    sourceAddressPrefixes: []
    destinationAddressPrefixes: []
  }
}

resource networkSecurityGroups_bo_platform_vm_india_nsg_name_admin_portal_ui 'Microsoft.Network/networkSecurityGroups/securityRules@2025-05-01' = {
  parent: networkSecurityGroups_bo_platform_vm_india_nsg_name_resource
  name: 'admin-portal-ui'
  properties: {
    protocol: '*'
    sourcePortRange: '*'
    destinationPortRange: '8181'
    sourceAddressPrefix: '*'
    destinationAddressPrefix: '*'
    access: 'Allow'
    priority: 380
    direction: 'Inbound'
    sourcePortRanges: []
    destinationPortRanges: []
    sourceAddressPrefixes: []
    destinationAddressPrefixes: []
  }
}

// ── Network Watcher — Central India 
resource networkWatchers_NetworkWatcher_centralindia_name_resource 'Microsoft.Network/networkWatchers@2025-05-01' = {
  name: networkWatchers_NetworkWatcher_centralindia_name
  location: 'centralindia'
  properties: {}
}

// ── Public IP Address — Central India
resource publicIPAddresses_bo_platform_vm_india_ip_name_resource 'Microsoft.Network/publicIPAddresses@2025-05-01' = {
  name: publicIPAddresses_bo_platform_vm_india_ip_name
  location: 'centralindia'
  sku: {
    name: 'Standard'
    tier: 'Regional'
  }
  zones: [
    '1'
  ]
  properties: {
    ipAddress: '135.235.196.109'
    publicIPAddressVersion: 'IPv4'
    publicIPAllocationMethod: 'Static'
    idleTimeoutInMinutes: 4
    ipTags: []
    ddosSettings: {
      protectionMode: 'VirtualNetworkInherited'
    }
  }
}

// ── Virtual Network — Central India 
resource virtualNetworks_bo_platform_vm_india_vnet_name_resource 'Microsoft.Network/virtualNetworks@2025-05-01' = {
  name: virtualNetworks_bo_platform_vm_india_vnet_name
  location: 'centralindia'
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.0.0.0/16'
      ]
    }
    privateEndpointVNetPolicies: 'Disabled'
    virtualNetworkPeerings: []
    enableDdosProtection: false
  }
}

// ── Subnet — Central India
resource virtualNetworks_bo_platform_vm_india_vnet_name_default 'Microsoft.Network/virtualNetworks/subnets@2025-05-01' = {
  parent: virtualNetworks_bo_platform_vm_india_vnet_name_resource
  name: 'default'
  properties: {
    addressPrefix: '10.0.0.0/24'
    delegations: []
    privateEndpointNetworkPolicies: 'Disabled'
    privateLinkServiceNetworkPolicies: 'Enabled'
  }
}

// ── Network Interface — Central India
resource networkInterfaces_bo_platform_vm_india632_z1_name_resource 'Microsoft.Network/networkInterfaces@2025-05-01' = {
  name: networkInterfaces_bo_platform_vm_india632_z1_name
  location: 'centralindia'
  properties: {
    ipConfigurations: [
      {
        name: 'ipconfig1'
        properties: {
          privateIPAddress: '10.0.0.4'
          privateIPAllocationMethod: 'Dynamic'
          publicIPAddress: {
            id: publicIPAddresses_bo_platform_vm_india_ip_name_resource.id
            properties: {
              deleteOption: 'Detach'
            }
          }
          subnet: {
            id: virtualNetworks_bo_platform_vm_india_vnet_name_default.id
          }
          primary: true
          privateIPAddressVersion: 'IPv4'
        }
      }
    ]
    dnsSettings: {
      dnsServers: []
    }
    enableAcceleratedNetworking: true
    enableIPForwarding: false
    disableTcpStateTracking: false
    networkSecurityGroup: {
      id: networkSecurityGroups_bo_platform_vm_india_nsg_name_resource.id
    }
    nicType: 'Standard'
    auxiliaryMode: 'None'
    auxiliarySku: 'None'
  }
}

// ── Virtual Machine — Central India 
resource virtualMachines_bo_platform_vm_india_name_resource 'Microsoft.Compute/virtualMachines@2025-11-01' = {
  name: virtualMachines_bo_platform_vm_india_name
  location: 'centralindia'
  zones: [
    '1'
  ]
  identity: {
    type: 'SystemAssigned'
  }
  properties: {
    hardwareProfile: {
      vmSize: 'Standard_D2s_v3'
    }
    additionalCapabilities: {
      hibernationEnabled: false
    }
    storageProfile: {
      imageReference: {
        publisher: 'canonical'
        offer: 'ubuntu-24_04-lts'
        sku: 'server'
        version: 'latest'
      }
      osDisk: {
        osType: 'Linux'
        name: '${virtualMachines_bo_platform_vm_india_name}_disk1_2e69963a153b4c1dafc4edf6ce4289bc'
        createOption: 'FromImage'
        caching: 'ReadWrite'
        managedDisk: {
          storageAccountType: 'Premium_LRS'
        }
        deleteOption: 'Delete'
        diskSizeGB: 30
      }
      dataDisks: []
      diskControllerType: 'SCSI'
    }
    osProfile: {
      computerName: virtualMachines_bo_platform_vm_india_name
      adminUsername: adminUsername
      linuxConfiguration: {
        disablePasswordAuthentication: true
        ssh: {
          publicKeys: [
            {
              path: '/home/${adminUsername}/.ssh/authorized_keys'
              keyData: extensions_enablevmAccess_ssh_key
            }
          ]
        }
        provisionVMAgent: true
        patchSettings: {
          patchMode: 'ImageDefault'
          assessmentMode: 'ImageDefault'
        }
      }
      secrets: []
      allowExtensionOperations: true
      // requireGuestProvisionSignal: true  // requires Microsoft.Compute/Agentless feature —  
    }
    securityProfile: {
      uefiSettings: {
        secureBootEnabled: true
        vTpmEnabled: true
      }
      securityType: 'TrustedLaunch'
    }
    networkProfile: {
      networkInterfaces: [
        {
          id: networkInterfaces_bo_platform_vm_india632_z1_name_resource.id
          properties: {
            deleteOption: 'Detach'
          }
        }
      ]
    }
    diagnosticsProfile: {
      bootDiagnostics: {
        enabled: true
      }
    }
  }
}

// ── VM Extension — Central India
resource virtualMachines_bo_platform_vm_india_name_enablevmAccess 'Microsoft.Compute/virtualMachines/extensions@2025-11-01' = {
  parent: virtualMachines_bo_platform_vm_india_name_resource
  name: 'enablevmAccess'
  location: 'centralindia'
  properties: {
    autoUpgradeMinorVersion: true
    publisher: 'Microsoft.OSTCExtensions'
    type: 'VMAccessForLinux'
    typeHandlerVersion: '1.5'
    settings: {}
    protectedSettings: {
      username: extensions_enablevmAccess_username
      password: extensions_enablevmAccess_password
      ssh_key: extensions_enablevmAccess_ssh_key
      reset_ssh: extensions_enablevmAccess_reset_ssh
      remove_user: extensions_enablevmAccess_remove_user
      expiration: extensions_enablevmAccess_expiration
    }
  }
}
