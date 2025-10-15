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
  type = string
}
