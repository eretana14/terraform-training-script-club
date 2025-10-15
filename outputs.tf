output "akamai_group" {
  description = "Output to show the akamai_group ID"
  value       = data.akamai_group.single_group.id
}

output "akamai_appsec_configuration" {
  description = "Output to show the akamai_appsec_configuration ID"
  value       = data.akamai_appsec_configuration.appsec_config.id
}

output "akamai_property" {
  description = "Output to show the akamai_property ID"
  value       = data.akamai_property.my_property.id
}