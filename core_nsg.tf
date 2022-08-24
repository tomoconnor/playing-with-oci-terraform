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