variable "edgerc_path" {
  type        = string
  description = "edgerc Path"
  #default = "~/.edgerc"
}

variable "config_section" {
  type        = string
  description = "Config Section"
  #default = "terraform-scriptclub"
}

variable "ab_test" {
  description = "Conditionals exercise"
  type        = string
}

variable "apps" {
  type        = list(string)
  description = "For Interactions exercise"
}

variable "activate_latest_on_staging" {
  type    = bool
  default = true
}

variable "activate_latest_on_production" {
  type    = bool
  default = true
}

variable "contractid" {
  type        = string
  default     = ""
  description = "Value unknown at the time of import. Please update."
}

variable "groupid" {
  type        = string
  default     = ""
  description = "Value unknown at the time of import. Please update."
}


variable "dns_records" {
  default = {
    "api" = {
      zone       = "eretana-terraform.com"
      recordType = "CNAME"
      ttl        = 300
      target     = "eretana-terraform-scriptclub.test.edgesuite.net"
      name       = "api.eretana-terraform.com"
    },
    "blog" = {
      zone       = "eretana-terraform.com"
      recordType = "CNAME"
      ttl        = 300
      target     = "eretana-terraform-scriptclub.test.edgesuite.net"
      name       = "blog.eretana-terraform.com"
    },
    "cdn" = {
      zone       = "eretana-terraform.com"
      recordType = "CNAME"
      ttl        = 300
      target     = "eretana-terraform-scriptclub.test.edgesuite.net"
      name       = "cdn.eretana-terraform.com"
    },
    "shop" = {
      zone       = "eretana-terraform.com"
      recordType = "CNAME"
      ttl        = 300
      target     = "eretana-terraform-scriptclub.test.edgesuite.net"
      name       = "shop.eretana-terraform.com"
    },
    "www" = {
      zone       = "eretana-terraform.com"
      recordType = "CNAME"
      ttl        = 300
      target     = "eretana-terraform-scriptclub.test.edgesuite.net"
      name       = "www.eretana-terraform.com"
    },
    "eretana" = {
      zone       = "eretana-terraform.com"
      recordType = "CNAME"
      ttl        = 300
      target     = "eretana-terraform-scriptclub.test.edgesuite.net"
      name       = "eretana-terraform-scriptclub.eretana-terraform.com"
    },
  }
}