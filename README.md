![Terraform Module Test](https://github.com/rmnobarra/azure-mysql-flexible-server-terraform-module/actions/workflows/workflow.yaml/badge.svg)

# Terraform Azure Mysql Flexible Server.

This Terraform module creates mysql flexible server

## Usage

```hcl
module "mysql_flexible_server" {
  source    = "git::https://github.com/rmnobarra/azure-mysql-flexible-server-terraform-module.git?ref=v1.0.0"
  resource_group_name = "meu-grupo-de-recursos"
  location            = "westus2"
  virtual_network_name = "vnet"
  virtual_network_id   = "vnet_id"
}
```


Theres a fullexample in `/examples` folder.