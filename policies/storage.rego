package main

# Deny if any storage container/bucket access is set to public
deny[msg] {
  resource := input.resource_changes[_]
  
  # Check Azure storage container
  resource.type == "azurerm_storage_container"
  resource.change.after.container_access_type != "private"
  msg := sprintf("DENY: Azure storage container '%s' has public access type '%s'. Must be private.", [resource.address, resource.change.after.container_access_type])
}

deny[msg] {
  resource := input.resource_changes[_]
  
  # Check AWS S3 bucket public access block
  resource.type == "aws_s3_bucket_public_access_block"
  (resource.change.after.block_public_acls != true) or (resource.change.after.block_public_policy != true)
  msg := sprintf("DENY: AWS S3 bucket public access block '%s' must block public ACLs and policy.", [resource.address])
}
