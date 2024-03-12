variable "resource_group_name" {
  type        = string
  description = "The name of the resource group."
}

variable "location" {
  type        = string
  description = "The Azure region where the resources will be created."
}

variable "virtual_network_name" {
  type        = string
  description = "The name of the virtual network."
}

variable "virtual_network_id" {
  type        = string
  description = "The ID of the virtual network."
}

variable "subnet_name" {
  type        = string
  description = "The name for the subnet."
  default     = "subnet_d"
}

variable "subnet_address_prefixes" {
  type        = list(string)
  description = "The address prefixes for the subnet."
  default     = ["10.10.4.0/24"]
}

variable "private_dns_zone_name" {
  type        = string
  description = "The name of the private DNS zone."
  default     = "mysqlprod.mysql.database.azure.com"
}

variable "dns_zone_link_name" {
  type        = string
  description = "The name for the DNS zone link."
  default     = "mysql_prod_dns_link"
}

variable "mysql_server_name_prefix" {
  type        = string
  description = "Prefix for the MySQL server name."
}

variable "mysql_version" {
  type        = string
  description = "MySQL server version."
  default     = "5.7"
}

variable "mysql_sku_name" {
  type        = string
  description = "The SKU name for the MySQL server."
  default     = "GP_Standard_D2ds_v4"
}

variable "mysql_storage_size_gb" {
  type        = number
  description = "Storage size in GB for the MySQL server."
  default     = 600
}

variable "firewall_rule_start_ip" {
  type        = string
  description = "Start IP address for the MySQL firewall rule."
  default     = "0.0.0.0"
}

variable "firewall_rule_end_ip" {
  type        = string
  description = "End IP address for the MySQL firewall rule."
  default     = "255.255.255.255"
}

variable "username_length" {
  type        = number
  description = "The length of the generated username."
  default     = 8
}

variable "password_length" {
  type        = number
  description = "The length of the generated password."
  default     = 16
}

variable "backup_retention_days" {
  type        = number
  description = "Backup retention days for the MySQL server."
  default     = 7
}

variable "auto_grow_enabled" {
  type        = bool
  description = "Specifies if the storage for the MySQL server should auto-grow."
  default     = true
}

variable "maintenance_day_of_week" {
  type        = number
  description = "The day of the week for the maintenance window."
  default     = 0
}

variable "maintenance_start_hour" {
  type        = number
  description = "The start hour for the maintenance window."
  default     = 0
}

variable "maintenance_start_minute" {
  type        = number
  description = "The start minute for the maintenance window."
  default     = 0
}

variable "mysql_configuration_interactive_timeout" {
  type        = string
  description = "Value for the MySQL server configuration 'interactive_timeout'."
  default     = "600"
}
