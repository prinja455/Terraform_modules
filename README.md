# 🚀 Terraform Azure Infrastructure

![Terraform](https://img.shields.io/badge/Terraform-7B42BC?style=for-the-badge\&logo=terraform\&logoColor=white)
![Azure](https://img.shields.io/badge/Microsoft%20Azure-0078D4?style=for-the-badge\&logo=microsoftazure\&logoColor=white)
![Infrastructure as Code](https://img.shields.io/badge/Infrastructure%20as%20Code-IaC-blue?style=for-the-badge)

This repository contains **Terraform Infrastructure as Code (IaC)** for provisioning Azure resources using a reusable **parent-child module architecture**.

The infrastructure supports multiple environments:

> 🛠️ **DEV**    🧪 **TEST**    🚀 **PROD**

---

## 🏗️ Architecture

The infrastructure follows a reusable **Parent → Child Module** architecture.

```text
                    ☁️ Azure
                       │
                       ▼
                🧩 Parent Module
                       │
                       ▼
                📦 Child Module
                  ┌────┴────┐
                  │         │
                  ▼         ▼
             🗂️ Resource   💾 Storage
                Group       Account
```

The **parent module** is responsible for calling and configuring the child module.

The **child module** contains the reusable Azure resource definitions.

---

## 📦 Resources

The Terraform module provisions the following Azure resources:

| Icon | Resource        | Description                           |
| ---- | --------------- | ------------------------------------- |
| 🗂️  | Resource Group  | Logical container for Azure resources |
| 💾   | Storage Account | Azure storage service                 |
| 🌍   | Environment     | Supports DEV, TEST and PROD           |

---

## 🌎 Environments

The same reusable module is used across multiple environments.

### 🛠️ DEV

Development environment used for development and initial infrastructure testing.

```text
Environment     : dev
Resource Group  : rg-<project>-dev
Storage Account : st<project>dev
```

### 🧪 TEST

Testing environment used to validate infrastructure and application changes.

```text
Environment     : test
Resource Group  : rg-<project>-test
Storage Account : st<project>test
```

### 🚀 PROD

Production environment used for live workloads.

```text
Environment     : prod
Resource Group  : rg-<project>-prod
Storage Account : st<project>prod
```

---

## 📁 Project Structure

```text
📦 terraform-azure-infrastructure
│
├── 📄 README.md
├── 📄 main.tf
├── 📄 variables.tf
├── 📄 outputs.tf
├── 📄 providers.tf
│
├── 📂 modules
│   └── 📂 storage
│       ├── 📄 main.tf
│       ├── 📄 variables.tf
│       └── 📄 outputs.tf
│
└── 📂 environments
    │
    ├── 📂 dev
    │   ├── 📄 main.tf
    │   ├── 📄 variables.tf
    │   └── 📄 terraform.tfvars
    │
    ├── 📂 test
    │   ├── 📄 main.tf
    │   ├── 📄 variables.tf
    │   └── 📄 terraform.tfvars
    │
    └── 📂 prod
        ├── 📄 main.tf
        ├── 📄 variables.tf
        └── 📄 terraform.tfvars
```

---

## 🧩 Parent → Child Module

The parent module calls the reusable child module.

```hcl
module "storage" {
  source = "../../modules/storage"

  resource_group_name  = var.resource_group_name
  location             = var.location
  storage_account_name = var.storage_account_name
  environment          = var.environment
}
```

### 🔄 Module Flow

```text
👨‍💻 Environment Configuration
            │
            ▼
       🧩 Parent Module
            │
            ▼
       📦 Child Module
            │
       ┌────┴────┐
       ▼         ▼
    🗂️ RG      💾 Storage
```

This approach provides:

* ♻️ **Reusability**
* 🧹 **Less code duplication**
* 🔒 **Environment isolation**
* 📐 **Consistent infrastructure**
* 🛠️ **Easy maintenance**
* 📈 **Easy scalability**

---

## ⚙️ Prerequisites

Make sure the following tools are installed:

| Tool                  | Purpose                             |
| --------------------- | ----------------------------------- |
| 🏗️ Terraform         | Infrastructure provisioning         |
| ☁️ Azure CLI          | Azure authentication and management |
| 🔐 Azure Subscription | Resource deployment                 |
| 👤 Azure Permissions  | Required resource permissions       |

Check Terraform:

```bash
terraform version
```

Check Azure CLI:

```bash
az version
```

Login to Azure:

```bash
az login
```

---

## 🚀 Terraform Workflow

### 1️⃣ Initialize

```bash
terraform init
```

### 2️⃣ Format

```bash
terraform fmt -recursive
```

### 3️⃣ Validate

```bash
terraform validate
```

### 4️⃣ Plan

```bash
terraform plan
```

### 5️⃣ Apply

```bash
terraform apply
```

### 🗑️ Destroy

```bash
terraform destroy
```

---

## 🌍 Environment Deployment

### 🛠️ DEV

```bash
cd environments/dev

terraform init
terraform plan
terraform apply
```

### 🧪 TEST

```bash
cd environments/test

terraform init
terraform plan
terraform apply
```

### 🚀 PROD

```bash
cd environments/prod

terraform init
terraform plan
terraform apply
```

> ⚠️ **Always review the Terraform plan carefully before applying changes to PROD.**

---

## 🔧 Variables

Typical variables used by the module:

| Variable                  | Description          | Example            |
| ------------------------- | -------------------- | ------------------ |
| 🌍 `environment`          | Environment name     | `dev`              |
| 📍 `location`             | Azure region         | `Central India`    |
| 🗂️ `resource_group_name` | Resource Group name  | `rg-myproject-dev` |
| 💾 `storage_account_name` | Storage Account name | `stmyprojectdev`   |

Example:

```hcl
environment          = "dev"
location             = "Central India"
resource_group_name  = "rg-myproject-dev"
storage_account_name = "stmyprojectdev"
```

---

## 📤 Outputs

The module can expose important resource information using Terraform outputs.

```hcl
output "resource_group_name" {
  value = azurerm_resource_group.this.name
}

output "storage_account_name" {
  value = azurerm_storage_account.this.name
}
```

---

## 🔐 State Management

Each environment should maintain its own Terraform state.

```text
🛠️ DEV   → dev.tfstate
🧪 TEST  → test.tfstate
🚀 PROD  → prod.tfstate
```

For team-based or production environments, it is recommended to use a **remote Azure Storage backend** for Terraform state management.

---

## 🛡️ Best Practices

* ♻️ Use reusable child modules.
* 🌍 Keep environment-specific configuration separate.
* 🔐 Never hardcode secrets or credentials.
* 📦 Use variables instead of hardcoded values.
* 🔎 Always review `terraform plan`.
* ☁️ Use remote state for team environments.
* 🚀 Keep PROD isolated from DEV and TEST.
* 🏷️ Follow consistent Azure naming conventions.
* 📌 Pin Terraform provider/module versions where appropriate.
* 🔄 Keep infrastructure code under version control.

---

## 📊 Environment Overview

| Environment | Purpose     | Resources           |
| ----------- | ----------- | ------------------- |
| 🛠️ **DEV** | Development | 🗂️ RG + 💾 Storage |
| 🧪 **TEST** | Testing     | 🗂️ RG + 💾 Storage |
| 🚀 **PROD** | Production  | 🗂️ RG + 💾 Storage |

---

## 🎯 Summary

This project uses a **Terraform Parent → Child module architecture** to provision and manage Azure infrastructure.

The reusable child module creates:

> 🗂️ **Resource Group** + 💾 **Storage Account**

The same module is consumed by multiple environments:

> 🛠️ **DEV** → 🧪 **TEST** → 🚀 **PROD**

This architecture provides a clean, reusable, scalable and maintainable approach to managing Azure infrastructure with Terraform.

---

### 🛠️ Built With

![Terraform](https://img.shields.io/badge/Terraform-7B42BC?style=flat-square\&logo=terraform\&logoColor=white)
![Microsoft Azure](https://img.shields.io/badge/Azure-0078D4?style=flat-square\&logo=microsoftazure\&logoColor=white)
![Git](https://img.shields.io/badge/Git-F05032?style=flat-square\&logo=git\&logoColor=white)
![GitHub](https://img.shields.io/badge/GitHub-181717?style=flat-square\&logo=github\&logoColor=white)
