resource "akamai_gtm_domain" "eretana-terraformscriptclub" {
  contract                  = var.contractid
  group                     = var.groupid
  name                      = "eretana-terraformscriptclub.akadns.net"
  type                      = "basic"
  comment                   = "testing - script club terraform "
  email_notification_list   = ["eretana@akamai.com"]
  default_timeout_penalty   = 25
  load_imbalance_percentage = 10
  default_error_penalty     = 75
  cname_coalescing_enabled  = false
  load_feedback             = false
  end_user_mapping_enabled  = false
  sign_and_serve            = false
}

#Command to export gtm domains USING 
#akamai terraform export-domain eretana-terraformscriptclub.akadns.net  

#Command to import gtm domain into state file  are under import.sh file 