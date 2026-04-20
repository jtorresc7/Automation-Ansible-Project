resource "azurerm_postgresql_flexible_server" "dbserver" {
  name                = var.postgresql_server_name
  resource_group_name = var.resource_group_name
  location            = var.location

  administrator_login    = var.db_admin_username
  administrator_password = var.db_admin_password

  sku_name   = var.db_sku_name
  version    = var.db_version
  storage_mb = var.db_storage_mb

  backup_retention_days = 7
  zone                  = "1"

  tags = var.tags
}
