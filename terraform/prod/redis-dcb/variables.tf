###### VRA PARAMETERS
variable "username" {
  default = "v_service_account@dc.fin"
}
variable "password" {
  default = "?@09AZAfJV0Z9bWxLzaErUJRkCzWLWigKT5w4zyXQqeUnUcdT2XBJ9dueoON4SS+"
}
variable "tenant" {
  default = "fintech"
}

variable "host" {
  default = "https://cloud.intranet.fin"
}

variable "tenant_env" {
  default = "Tn-PROD"
}


############ BU & TEAM PARAMETERS
variable "bu_name" {
  default = "EC"
}

variable "bu_id" {
  default = "6666acd2-cf9e-4659-bf6e-fd8a3bf59b8c"
}

variable "bu_tag" {
  default = "EC"
}


################ CATALOG PARAMETERS 
variable "catalog_item" {}

variable "catalog_id" {}

variable "datacenter" {}

variable "catalog_os" {}

#variable "catalog_network" {}

variable "catalog_new_network" {}

variable "count_server" {}

################ APPLICATION PARAMETERS
variable "app_name" {}

variable "app_reason" {}

variable "app_description" {}

variable "app_type" {}

variable "app_env" {}

variable "app_team" {}

variable "app_email" {}

variable "app_tag" {}

variable "app_nodes" {}

variable "app_pass" {}

variable "app_flavor" {}
