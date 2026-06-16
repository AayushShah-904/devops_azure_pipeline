# Sandbox Infrastructure Guide

> **Two-step process:** Bootstrap (once) → Deploy infrastructure (anytime)

---

## Requirements

Install these before starting:

- **Terraform** ≥ 1.0 → https://developer.hashicorp.com/terraform/install
- **Azure CLI** → https://learn.microsoft.com/cli/azure/install-azure-cli

```bash
az login                                    # sign in to Azure
az account list --output table              # find your Subscription ID + Tenant ID
az account set --subscription "<SUB_ID>"   # set the active subscription
```

---

## Switching Accounts / Subscriptions

> Do this **every time** you use a different Azure account or subscription.

**1. Update `terraform/bootstrap/terraform.tfvars.json`**
```json
{ "subscription_id": "<YOUR_SUBSCRIPTION_ID>" }
```

**2. Update `terraform/terraform.tfvars.json`**
```json
{
  "subscription_id": "<YOUR_SUBSCRIPTION_ID>",
  "tenant_id":       "<YOUR_TENANT_ID>"
}
```

**3. If the storage account name conflicts** (it must be globally unique):

- Change `storage_account_name` in `bootstrap/terraform.tfvars.json`
- Match the new name in the `backend` block inside `terraform/providers.tf`

---

## Step 1 — Bootstrap *(run once per subscription)*

Creates the Azure Storage Account that holds Terraform remote state.

```bash
cd terraform/bootstrap

# First time only — copy example and fill in your subscription ID
copy terraform.tfvars.json.example terraform.tfvars.json

terraform init
terraform plan
terraform apply          # type 'yes' to confirm
```

After apply you'll see:
```
resource_group_name  = "bo-sandbox-backend-rg"
storage_account_name = "bosandboxstate4427"
container_name       = "tfstate"
```

---

## Step 2 — Deploy Infrastructure

```bash
cd terraform

# First time only — copy example and fill in your values
copy terraform.tfvars.json.example terraform.tfvars.json
# Set at minimum: subscription_id, tenant_id, admin_password

terraform init
terraform plan
terraform apply          # type 'yes' to confirm
```

**What gets created (Central India region):**

| Resource | Details |
|---|---|
| Resource Group | `bo-sandbox-rg-tf` |
| Virtual Network | `10.0.0.0/16` |
| Subnet | `10.0.0.0/24` |
| Network Security Group | SSH port 22 open |
| Public IP | Static |
| Network Interface | Attached to VM |
| Linux VM (Ubuntu 24.04 LTS) | `Standard_B2s` |
| SSH Key | Auto-generated RSA 4096 |

> West US 2 resources are commented out in `main.tf` — uncomment to enable them.

---

## Common Commands

Run these from the `terraform/` directory.

```bash
terraform output                  # view all outputs
terraform state list              # list all managed resources
terraform plan                    # preview changes before applying
terraform apply                   # deploy changes
terraform fmt -recursive          # auto-format .tf files
terraform validate                # check for syntax errors
terraform init -upgrade           # upgrade provider versions
```

---

## Destroying Resources

> ⚠️ Irreversible — all Azure resources will be deleted.

```bash
# Destroy main infrastructure
cd terraform/
terraform destroy

# Destroy bootstrap backend (only after main infra is destroyed)
cd terraform/bootstrap/
terraform destroy

# Destroy a single resource
terraform destroy -target=azurerm_linux_virtual_machine.vm_india
```
