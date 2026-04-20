variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "postgresql_server_name" {
  type = string
}

variable "db_admin_username" {
  type = string
}

variable "db_admin_password" {
  type      = string
  sensitive = true
}

variable "db_sku_name" {
  type = string
}

variable "db_storage_mb" {
  type = number
}

variable "db_version" {
  type = string
}

variable "tags" {
  type = map(string)
}
