variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "availability_set_name" {
  type = string
}

variable "vm_name" {
  type = string
}

variable "vm_count" {
  type = number
}

variable "boot_diagnostics_storage_uri" {
  type = string
}

variable "vm_size" {
  type = string
}

variable "admin_username" {
  type    = string
  default = "azureuser"
}

variable "admin_password" {
  type      = string
  sensitive = true
}

variable "tags" {
  type = map(string)
}
