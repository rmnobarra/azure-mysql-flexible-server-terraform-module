output "mysql_server_id" {
  description = "The ID of the MySQL server."
  value       = azurerm_mysql_flexible_server.mysql_prod.id
}

output "mysql_server_name" {
  description = "The name of the MySQL server."
  value       = azurerm_mysql_flexible_server.mysql_prod.name
}

output "mysql_server_fqdn" {
  description = "The fully qualified domain name of the MySQL server."
  value       = azurerm_mysql_flexible_server.mysql_prod.fqdn
}

output "mysql_server_admin_login" {
  description = "The administrator login name for the MySQL server."
  value       = azurerm_mysql_flexible_server.mysql_prod.administrator_login
}

output "mysql_server_admin_password" {
  description = "The administrator password for the MySQL server. This output is sensitive and should be treated with care."
  value       = random_password.password.result
  sensitive   = true
}

output "subnet_id" {
  description = "The ID of the subnet used for the MySQL server."
  value       = azurerm_subnet.subnet.id
}

output "private_dns_zone_id" {
  description = "The ID of the private DNS zone used for the MySQL server."
  value       = azurerm_private_dns_zone.mysql_dns_prod_zone.id
}

output "dns_zone_virtual_network_link_id" {
  description = "The ID of the virtual network link to the private DNS zone."
  value       = azurerm_private_dns_zone_virtual_network_link.mysql_prod_dns_link.id
}
