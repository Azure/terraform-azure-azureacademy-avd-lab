variable "tenant_id" {
  type = string
}

variable "subscription_id" {
  type = string
}

variable "mypublicipaddress" {
  type = string
}

variable "adminusername" {
  type    = string
  default = "localadmin"
}

variable "adminpassword" {
  type = string

}

variable "timezone" {
  type    = string
  default = "Pacific Standard Time"
}

variable "domain_name" {
  type    = string
  default = "contoso.com"
}
