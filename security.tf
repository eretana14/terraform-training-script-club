resource "akamai_appsec_configuration" "security_configuration" {
  name        = "eretana-scriptclub"
  description = "Security config using terraform"
  contract_id = "1-5C13O2"
  group_id    = "299415"
  host_names  = ["eretana-scriptclub.test.edgekey.net"]
}

// Create new with default settings
resource "akamai_appsec_security_policy" "security-policy" {
  config_id              = akamai_appsec_configuration.security_configuration.config_id
  default_settings       = true
  security_policy_name   = "my-policy"
  security_policy_prefix = "t14"
}

