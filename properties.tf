resource "akamai_gtm_property" "test" {
  domain                      = akamai_gtm_domain.eretana-terraformscriptclub.name
  name                        = "test"
  type                        = "failover"
  ipv6                        = false
  score_aggregation_type      = "worst"
  stickiness_bonus_percentage = 0
  stickiness_bonus_constant   = 0
  use_computed_targets        = false
  balance_by_download_score   = false
  dynamic_ttl                 = 60
  handout_limit               = 0
  handout_mode                = "normal"
  failover_delay              = 0
  failback_delay              = 0
  ghost_demand_reporting      = false
  traffic_target {
    datacenter_id = akamai_gtm_datacenter.dc1.datacenter_id
    enabled       = true
    weight        = 1
    servers       = ["1.1.1.1"]
  }
  liveness_test {
    name                             = "test"
    peer_certificate_verification    = false
    test_interval                    = 60
    test_object                      = "/"
    http_error3xx                    = true
    http_error4xx                    = true
    http_error5xx                    = true
    http_method                      = "GET"
    pre_2023_security_posture        = false
    disabled                         = false
    test_object_protocol             = "HTTP"
    test_object_port                 = 80
    disable_nonstandard_port_warning = false
    test_timeout                     = 10
    answers_required                 = false
    recursion_requested              = false
  }
  depends_on = [
    akamai_gtm_datacenter.dc1,
    akamai_gtm_domain.eretana-terraformscriptclub
  ]
}

