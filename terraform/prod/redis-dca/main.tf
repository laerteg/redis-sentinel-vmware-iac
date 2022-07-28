
provider "vra7" {
  username = "${var.username}"
  password = "${var.password}"
  tenant   = "${var.tenant}"
  host     = "${var.host}"
  insecure = true
}


resource "vra7_deployment" "redis_node" {
  count             = "${var.count_server}"
  catalog_item_name = "${var.catalog_item}"
  catalog_item_id   = "${var.catalog_id}"
  description       = "${var.app_description}-${var.app_env}"
  reasons           = "Provisionar VM em EPG Prod DCA"

  deployment_configuration = {
    _leaseDays           = "0"
    _number_of_instances = "${var.app_nodes}"
    _deploymentName      = "${var.app_name}-${count.index + 1}"
    deployment_property  = "${var.app_reason}"
  }

  resource_configuration = {
    "EPG-Passwd_1.BU"                     = "${var.bu_name}"
    "EPG-Passwd_1.SO"                     = "${var.catalog_os}"
    "EPG-Passwd_1._declarationId"         = "EPG-Passwd_1"
    "EPG-Passwd_1.appName"                = "${var.app_name}-${count.index + 1}"
    "EPG-Passwd_1.appType"                = "${var.app_type}"
    "EPG-Passwd_1.environment"            = "${var.app_env}"
    "EPG-Passwd_1.vm"                     = ""
    #"EPG-Passwd_1.currentNetwork"         = "${var.catalog_network}"
    "EPG-Passwd_1.newNetwork"             = "${var.catalog_new_network}"
    "EPG-Passwd_1.password"               = "${var.app_pass}"
    "EPG-Passwd_1.site"                   = "${var.datacenter}"
    "EPG-Passwd_1.teamName"               = "${var.app_team}"
    "EPG-Passwd_1.tenant"                 = "${var.tenant_env}"
    "EPG-Passwd_1.email"                  = "${var.app_email}"
    "LINUXSUSE_15SP1.datacenter_location" = "${var.datacenter}"
    "LINUXSUSE_15SP1.size"                = "ValueSet.${var.app_flavor}"
    "LINUXSUSE_15SP1.vRO_BU"              = "${var.bu_tag}"
    "LINUXSUSE_15SP1.vRO_Tag"             = "${var.app_tag}"
  }

  wait_timeout     = 20
  businessgroup_id = "${var.bu_id}"
}

output "vm_ids" {
  value = "${vra7_deployment.redis_node.*.id}"
}