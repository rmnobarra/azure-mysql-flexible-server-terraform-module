resource "random_string" "name" {
  length  = var.username_length
  lower   = true
  numeric = false
  special = false
  upper   = false
}

resource "random_password" "password" {
  length           = var.password_length
  lower            = true
  min_lower        = 1
  min_numeric      = 1
  min_special      = 1
  min_upper        = 1
  numeric          = true
  override_special = "_"
  special          = true
  upper            = true
}

resource "azurerm_subnet" "subnet" {
  name                 = var.subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.virtual_network_name
  address_prefixes     = var.subnet_address_prefixes
  service_endpoints    = ["Microsoft.Storage"]
  delegation {
    name = "fs"
    service_delegation {
      name = "Microsoft.DBforMySQL/flexibleServers"
      actions = ["Microsoft.Network/virtualNetworks/subnets/join/action"]
    }
  }
}

resource "azurerm_private_dns_zone" "mysql_dns_prod_zone" {
  name                = var.private_dns_zone_name
  resource_group_name = var.resource_group_name
}

resource "azurerm_private_dns_zone_virtual_network_link" "mysql_prod_dns_link" {
  name                  = var.dns_zone_link_name
  private_dns_zone_name = azurerm_private_dns_zone.mysql_dns_prod_zone.name
  virtual_network_id    = var.virtual_network_id
  resource_group_name   = var.resource_group_name
}

resource "azurerm_mysql_flexible_server" "mysql_prod" {
  name                   = "${var.mysql_server_name_prefix}-${random_string.name.result}"
  version                = var.mysql_version
  resource_group_name    = var.resource_group_name
  location               = var.location
  administrator_login    = random_string.name.result
  administrator_password = random_password.password.result
  backup_retention_days  = var.backup_retention_days
  delegated_subnet_id    = azurerm_subnet.subnet.id
  private_dns_zone_id    = azurerm_private_dns_zone.mysql_dns_prod_zone.id
  sku_name               = var.mysql_sku_name
  storage {
    auto_grow_enabled = var.auto_grow_enabled
    size_gb           = var.mysql_storage_size_gb
  }
  maintenance_window {
    day_of_week  = var.maintenance_day_of_week
    start_hour   = var.maintenance_start_hour
    start_minute = var.maintenance_start_minute
  }

  depends_on = [ azurerm_private_dns_zone.mysql_dns_prod_zone, azurerm_private_dns_zone_virtual_network_link.mysql_prod_dns_link ]
}

resource "azurerm_mysql_flexible_server_firewall_rule" "mysql_prod_fw_rule" {
  name                = "AllowMyIP"
  resource_group_name = var.resource_group_name
  server_name         = azurerm_mysql_flexible_server.mysql_prod.name
  start_ip_address    = var.firewall_rule_start_ip
  end_ip_address      = var.firewall_rule_end_ip
}

resource "azurerm_mysql_flexible_server_configuration" "mysql_prod_configuration" {
  name                = "interactive_timeout"
  resource_group_name = var.resource_group_name
  server_name         = azurerm_mysql_flexible_server.mysql_prod.name
  value               = var.mysql_configuration_interactive_timeout
}
