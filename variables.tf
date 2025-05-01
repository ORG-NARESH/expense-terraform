
variable "token" {
  description = "Vault token for accessing secrets"
  type        = string
}
variable "domain" {
  default = "eternallearnings.shop"
}

variable "prometheus_server" {}
variable "env" {}
variable "path" {}
variable "components" {}
variable "port_no_of_nodeexporter" {}
