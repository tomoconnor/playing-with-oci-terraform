resource "oci_core_network_security_group" "main_network_security_group" {
    #Required
    compartment_id = oci_identity_compartment.tf_compartment.id
    vcn_id = module.vcn.vcn_id

    #Optional
    display_name = "Main Network Security Group"
}

resource "oci_core_network_security_group_security_rule" "nsg_rule_ssh_in" {
    #Required
    for_each = var.allowed_acl
    network_security_group_id = oci_core_network_security_group.main_network_security_group.id
    direction = "INGRESS"
    protocol = "6" //tcp

    #Optional
    description = format("Allow SSH from Trusted Hosts (%s)", each.key)
    destination = var.cidr_block
    destination_type = "CIDR_BLOCK"
    

    source = each.value
    source_type = "CIDR_BLOCK"
    stateless = false
    tcp_options {

        #Optional
        destination_port_range {
            #Required
            max = "22"
            min = "22"
        }
        source_port_range {
            #Required
            max = "65535"
            min = "1"
        }
    }

}

resource "oci_core_network_security_group_security_rule" "nsg_rule_http_out" {
    #Required
    network_security_group_id = oci_core_network_security_group.main_network_security_group.id
    direction = "EGRESS"
    protocol = "6" //TCP

    #Optional
    description = "Allow HTTP Out"
    destination = "0.0.0.0/0"
    destination_type = "CIDR_BLOCK"
    

    source = var.cidr_block
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


resource "oci_core_network_security_group_security_rule" "nsg_rule_https_out" {
    #Required
    network_security_group_id = oci_core_network_security_group.main_network_security_group.id
    direction = "EGRESS"
    protocol = "6" //TCP

    #Optional
    description = "Allow HTTPS Out"
    destination = "0.0.0.0/0"
    destination_type = "CIDR_BLOCK"
    

    source = var.cidr_block
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

resource "oci_core_network_security_group_security_rule" "nsg_rule_smtptls_out" {
    #Required
    network_security_group_id = oci_core_network_security_group.main_network_security_group.id
    direction = "EGRESS"
    protocol = "6" //TCP

    #Optional
    description = "Allow SMTP_TLS Out"
    destination = "0.0.0.0/0"
    destination_type = "CIDR_BLOCK"
    

    source = var.cidr_block
    source_type = "CIDR_BLOCK"
    stateless = false
    tcp_options {

        #Optional
        destination_port_range {
            #Required
            max = "587"
            min = "587"
        }
        source_port_range {
            #Required
            max = "65535"
            min = "1"
        }
    }

}
