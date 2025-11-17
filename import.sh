terraform init
terraform import akamai_gtm_domain.eretana-terraformscriptclub "eretana-terraformscriptclub.akadns.net"
terraform import akamai_gtm_datacenter.dc1 "eretana-terraformscriptclub.akadns.net:1"
terraform import akamai_gtm_property.test "eretana-terraformscriptclub.akadns.net:test"