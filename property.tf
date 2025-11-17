# Resource for CP Code
resource "akamai_cp_code" "cp_code" {
  name        = "My CP Code"
  contract_id = "1-5C13O2"
  group_id    = "299415"
  product_id  = "prd_Fresca"
  timeouts {
    update = "1h"
  }
}

# Edge Hostname
resource "akamai_edge_hostname" "edge_hostname" {
  product_id    = "prd_Fresca"
  contract_id   = "1-5C13O2"
  group_id      = "299415"
  edge_hostname = "eretana-terraform-scriptclub.test.edgesuite.net"
  ip_behavior   = "IPV4"
  ttl           = 300
  timeouts {
    default = "1h"
  }
}


# ------------------------------------- Rules Builder ------------------------------------------ #

// Your default rule information
data "akamai_property_rules_builder" "rules_builder" {
  rules_v2025_04_29 {
    name      = "default"
    is_secure = false
    comments  = <<-EOT
      The behaviors in the default rule apply to all requests for the property hostnames unless another rule overrides these settings.
    EOT
    behavior {
      origin {
        origin_type           = "CUSTOMER"
        hostname              = var.ab_test == "A" ? "script-club-origin-1ovshfqo.fermyon.app" : "origin.mpulse-akaed.com"
        forward_host_header   = "ORIGIN_HOSTNAME"
        cache_key_hostname    = "REQUEST_HOST_HEADER"
        compress              = true
        enable_true_client_ip = false
        http_port             = 80
      }
    }
    behavior {
      cp_code {
        value {
          id   = akamai_cp_code.cp_code.id
          name = "main site"
        }
      }
    }
    behavior {
      caching {
        behavior = "NO_STORE"
      }
    }
    children = [
      data.akamai_property_rules_builder.compress_text_content.json
    ]
  }
}

// Your child rule information
data "akamai_property_rules_builder" "compress_text_content" {
  rules_v2025_04_29 {
    name                  = "Content Compression"
    criteria_must_satisfy = "all"
    criterion {
      content_type {
        match_case_sensitive = false
        match_operator       = "IS_ONE_OF"
        match_wildcard       = true
        values               = ["text/html*", "text/css*", "application/x-javascript*", "text/javascript*", "text/*", "application/javascript", "application/x-javascript", "application/json", "application/x-json", "application/*+json", "application/*+xml", "application/text", "application/vnd.microsoft.icon", "application/vnd-ms-fontobject", "application/x-font-ttf", "application/x-font-opentype", "application/x-font-truetype", "application/xmlfont/eot", "application/xml", "font/opentype", "font/otf", "font/eot", "image/svg+xml", "image/vnd.microsoft.icon", "application/json*", "text/xml*", ]
      }
    }
    behavior {
      gzip_response {
        behavior = "ALWAYS"
      }
    }
  }
}

#Property Resource 
resource "akamai_property" "property" {
  name          = "eretana-terraform-scriptclub"
  product_id    = "prd_Fresca"
  contract_id   = "1-5C13O2"
  group_id      = "299415"
  rule_format   = "v2025-04-29"
  version_notes = "Initial Configuration"
  rules         = data.akamai_property_rules_builder.rules_builder.json
  dynamic "hostnames" {
    for_each = local.app_hostnames
    content {
      cname_from             = hostnames.value
      cname_to               = akamai_edge_hostname.edge_hostname.edge_hostname
      cert_provisioning_type = "DEFAULT"
    }
  }
}

output "my_default_rule" {
  value = data.akamai_property_rules_builder.rules_builder
}

# resource "akamai_property_activation" "my_activation-staging" {
#   property_id                    = akamai_property.property.id
#   network                        = "STAGING"
#   contact                        = ["eretana@akamai.com"]
#   note                           = "initial version"
#   version                        = var.activate_latest_on_staging ? akamai_property.property.latest_version : akamai_property.property.staging_version
#   auto_acknowledge_rule_warnings = true
#   # lifecycle {
#   #   ignore_changes = [
#   #       note
#   #   ]
#   # }
# }

# resource "akamai_property_activation" "my_activation-production" {
#   property_id                    = akamai_property.property.id
#   network                        = "PRODUCTION"
#   contact                        = ["eretana@akamai.com"]
#   note                           = "initial version"
#   version                        = var.activate_latest_on_production ? akamai_property.property.latest_version : akamai_property.property.production_version
#   auto_acknowledge_rule_warnings = true
#   timeouts {
#     default = "1h"
#   }
#   depends_on = [akamai_property_activation.my_activation-staging]
# }