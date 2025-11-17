resource "akamai_gtm_datacenter" "dc1" {
  domain                            = akamai_gtm_domain.eretana-terraformscriptclub.name
  nickname                          = "dc1"
  city                              = "San José"
  state_or_province                 = "Escazú"
  country                           = "CR"
  latitude                          = 9.933134
  longitude                         = -84.07978
  cloud_server_host_header_override = false
  cloud_server_targeting            = false
  depends_on = [
    akamai_gtm_domain.eretana-terraformscriptclub
  ]
}

