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

variable "vm_base_name" {
  type = string
}

#variable "vm_dns_labels" {
#  type = set(string)
#}

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

variable "public_key_path" {
  type = string
}

variable "tags" {
  type = map(string)
}

variable "vm_names" {
  type = set(string)
}
