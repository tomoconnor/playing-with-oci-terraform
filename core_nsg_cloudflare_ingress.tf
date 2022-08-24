resource "oci_core_network_security_group_security_rule" "nsg_rule_http_in" {
    #Required
    for_each = toset(data.cloudflare_ip_ranges.cloudflare.ipv4_cidr_blocks)
    network_security_group_id = oci_core_network_security_group.main_network_security_group.id
    direction = "INGRESS"
    protocol = "6" //tcp

    #Optional
    description = format("Cloudflare Ingress (%s)", each.value)
    destination = var.cidr_block
    destination_type = "CIDR_BLOCK"
    

    source = each.value
    source_type = "CIDR_BLOCK"
    stateless = false
    tcp_options {

        #Optional
        destination_port_range {
            #Required
            max = "80"
            min = "80"
        }
        source_port_range {
            #Required
            max = "65535"
            min = "1"
        }
    }

}

resource "oci_core_network_security_group_security_rule" "nsg_rule_https_in" {
    #Required
    for_each = toset(data.cloudflare_ip_ranges.cloudflare.ipv4_cidr_blocks)
    network_security_group_id = oci_core_network_security_group.main_network_security_group.id
    direction = "INGRESS"
    protocol = "6" //tcp

    #Optional
    description = format("Cloudflare Ingress (%s)", each.value)
    destination = var.cidr_block
    destination_type = "CIDR_BLOCK"
    

    source = each.value
    source_type = "CIDR_BLOCK"
    stateless = false
    tcp_options {

        #Optional
        destination_port_range {
            #Required
            max = "443"
            min = "443"
        }
        source_port_range {
            #Required
            max = "65535"
            min = "1"
        }
    }

}