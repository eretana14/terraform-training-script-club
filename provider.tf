terraform {
  required_providers {
    akamai = {
      source  = "akamai/akamai"
      version = ">= 6.1.0"
    }
  }
  required_version = "~> 1.8"
}

provider "akamai" {
  edgerc         = var.edgerc_path
  config_section = var.config_section
}