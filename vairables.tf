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

variable "storusaz140name" {
  type        = string
  description = "Storage account name in US, name must be globally unique"

}

variable "storjwaz140name" {
  type        = string
  description = "Storage account name in Japan, name must be globally unique"

}

variable "storukaz140name" {
  type        = string
  description = "Storage account name in UK, name must be globally unique"

}
