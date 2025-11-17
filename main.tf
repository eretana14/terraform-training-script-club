#Akamai Group
data "akamai_group" "single_group" {
  group_name  = "Script Club"
  contract_id = "ctr_1-5C13O2"
}

output "my_group_id" {
  value = data.akamai_group.single_group.id
}

#Akamai AppSec Configuration
data "akamai_appsec_configuration" "appsec_config" {
  name = "akamaitechday"
}

output "my_appsec_config" {
  value = data.akamai_appsec_configuration.appsec_config.host_names
}

#Akamai Property
data "akamai_property" "my_property" {
  name    = "eretana-scriptclub"
  version = "2"
}

output "my_property" {
  value = data.akamai_property.my_property.property_id
}

locals {
  notes = join(" - ", ["TF-3001", data.akamai_group.single_group.id])
  app_hostnames = concat(["eretana-terraform-scriptclub.eretana-terraform.com"],
  [for app in var.apps : "${app}.eretana-terraform.com"])
}

output "app_hostnames" {
  value = local.app_hostnames
}