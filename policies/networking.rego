package main

import rego.v1

# Deny if any security/firewall rule allows port 22 (SSH) from all sources (* or 0.0.0.0/0)
deny contains msg if {
  resource := input.resource_changes[_]
  
  # Check for Azure NSG rules
  resource.type == "azurerm_network_security_rule"
  resource.change.after.destination_port_range == "22"
  is_public_source(resource.change.after.source_address_prefix)
  msg := sprintf("DENY: Azure NSG rule '%s' allows SSH (port 22) from public source.", [resource.address])
}

deny contains msg if {
  resource := input.resource_changes[_]
  
  # Check for AWS Security Group rules
  resource.type == "aws_security_group_rule"
  resource.change.after.type == "ingress"
  resource.change.after.from_port <= 22
  resource.change.after.to_port >= 22
  is_public_cidr(resource.change.after.cidr_blocks[_])
  msg := sprintf("DENY: AWS security group rule '%s' allows SSH (port 22) from public CIDR.", [resource.address])
}

is_public_source(prefix) if {
  prefix == "*"
}
is_public_source(prefix) if {
  prefix == "0.0.0.0/0"
}
is_public_source(prefix) if {
  prefix == "Internet"
}

is_public_cidr(cidr) if {
  cidr == "0.0.0.0/0"
}
