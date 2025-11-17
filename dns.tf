# resource "akamai_dns_record" "my_record_type_cname" {
#      count = length(local.app_hostnames)
#     zone       = "eretana-terraform.com"
#     name       = local.app_hostnames[count.index]
#     recordtype = "CNAME"
#     ttl        = 300
#     target     = [akamai_edge_hostname.edge_hostname.edge_hostname]
# }

resource "akamai_dns_record" "my_record_type_cname" {
    for_each = var.dns_records

    zone       = each.value.zone
    name       = each.value.name
    recordtype = each.value.recordType
    ttl        = each.value.ttl
    target     = [each.value.target]
}

