# Azure Terraform — Windows VM Project

## Project Structure

```
azure-terraform/
├── providers.tf                  ← Root provider (reference only)
├── backend.tf                    ← Backend config (reference only)
├── variables.tf                  ← Root variables (reference only)
├── .gitignore
│
├── modules/
│   └── vm/
│       ├── main.tf               ← Creates: RG, VNet, Subnet, NSG, NIC, Public IP, Windows VM
│       ├── variables.tf          ← Module inputs
│       └── outputs.tf            ← Module outputs (IP addresses, IDs)
│
└── environments/
    ├── dev/
    │   ├── providers.tf          ← Azure provider + backend
    │   ├── main.tf               ← Calls vm module with dev values
    │   ├── variables.tf          ← Variable declarations
    │   ├── terraform.tfvars  ✏️  ← YOUR VALUES GO HERE
    │   └── outputs.tf            ← Prints IP + RDP command after apply
    │
    └── prod/
        ├── providers.tf
        ├── main.tf
        ├── variables.tf
        ├── terraform.tfvars  ✏️
        └── outputs.tf
```

---

## Prerequisites

1. **Install Terraform**: https://developer.hashicorp.com/terraform/install
2. **Install Azure CLI**: https://learn.microsoft.com/en-us/cli/azure/install-azure-cli
3. **Login to Azure**:
   ```bash
   az login
   ```

---

## Deploy DEV environment (step by step)

### Step 1 — Edit your password (only thing you MUST change)
Open `environments/dev/terraform.tfvars` and change the password:
```
admin_password = "YourStrongPassword123!"
```
Password rules: min 12 chars, must have uppercase + lowercase + number + symbol.

### Step 2 — Go into the dev folder
```bash
cd environments/dev
```

### Step 3 — Initialize Terraform (downloads Azure provider)
```bash
terraform init
```

### Step 4 — Preview what will be created
```bash
terraform plan
```

### Step 5 — Create the infrastructure
```bash
terraform apply
```
Type `yes` when prompted. Takes ~3-5 minutes.

### Step 6 — Get your VM's IP and RDP command
After apply finishes, you'll see:
```
Outputs:
  public_ip   = "20.x.x.x"
  rdp_command = "mstsc /v:20.x.x.x"
```

### Step 7 — Connect via RDP
- Press **Win+R**, type the `mstsc /v:20.x.x.x` command
- Username: `adminuser`
- Password: whatever you set in terraform.tfvars

---

## Destroy (to avoid Azure charges)
```bash
cd environments/dev
terraform destroy
```

---

## What gets created in Azure

| Resource | Name | Purpose |
|---|---|---|
| Resource Group | `rg-dev-myproject` | Container for all resources |
| Virtual Network | `dev-vnet` | Private network (10.0.0.0/16) |
| Subnet | `dev-subnet` | Sub-network (10.0.1.0/24) |
| NSG | `dev-nsg` | Firewall — allows RDP (port 3389) |
| Public IP | `dev-pip` | Static public IP for RDP access |
| NIC | `dev-nic` | Network card connecting VM to subnet |
| Windows VM | `dev-vm` | Windows Server 2022 Datacenter |

---

## Change the Azure region
In `terraform.tfvars`, change:
```
location = "Central India"   # or "UK South", "West Europe", etc.
```

## Change VM size
```
vm_size = "Standard_B4ms"    # 4 vCPU, 16 GB RAM
vm_size = "Standard_B2s"     # 2 vCPU, 4 GB RAM  (cheapest, default)
vm_size = "Standard_D4s_v3"  # 4 vCPU, 16 GB RAM (prod-grade)
```
