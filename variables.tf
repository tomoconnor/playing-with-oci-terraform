variable "tenancy_ocid" {
  type = string
}
variable "user_ocid" {
  type = string
}
variable "private_key_path" {
  type = string
}
variable "fingerprint" {
  type = string
}
variable "region" {
  type = string
}

variable "cloudflare_api_token" {
  type = string
}

variable "component_name" {
  type    = string
}

variable "dns_name" {
  type    = string
}

variable "cidr_block" {
  type    = string
  
}

variable "shape" {
    type    = string
    default = "VM.Standard.A1.Flex"
  
}

variable "allowed_acl" {
    type = map(string) 
}