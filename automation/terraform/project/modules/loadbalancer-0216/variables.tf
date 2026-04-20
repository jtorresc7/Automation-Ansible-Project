variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "lb_name" {
  type = string
}

variable "public_ip_name" {
  type = string
}

variable "backend_pool_name" {
  type = string
}

variable "probe_name" {
  type = string
}

variable "rule_name" {
  type = string
}

variable "linux_nic_ids" {
  type = list(string)
}

variable "ip_config_names" {
  type = list(string)
}

variable "tags" {
  type = map(string)
}
