# # Source from https://registry.terraform.io/providers/hashicorp/oci/latest/docs/resources/core_security_list

# resource "oci_core_security_list" "public_security_list" {

#   # Required
#   compartment_id = oci_identity_compartment.tf_compartment.id
#   vcn_id         = module.vcn.vcn_id

#   # Optional
#   display_name = "security-list-for-public-subnet"

#   egress_security_rules {
#     stateless        = false
#     destination      = "0.0.0.0/0"
#     destination_type = "CIDR_BLOCK"
#     protocol         = "all"
#   }


#   ingress_security_rules {
#     description = "Allow SSH from Anywhere"
#     stateless   = false
#     source      = "0.0.0.0/0"
#     source_type = "CIDR_BLOCK"
#     # Get protocol numbers from https://www.iana.org/assignments/protocol-numbers/protocol-numbers.xhtml TCP is 6
#     protocol = "6"
#     tcp_options {
#       min = 22
#       max = 22
#     }
#   }


#   ingress_security_rules {
#     description = "Allow ICMP from Anywhere"
#     stateless   = false
#     source      = "0.0.0.0/0"
#     source_type = "CIDR_BLOCK"
#     # Get protocol numbers from https://www.iana.org/assignments/protocol-numbers/protocol-numbers.xhtml ICMP is 1  
#     protocol = "1"

#     # For ICMP type and code see: https://www.iana.org/assignments/icmp-parameters/icmp-parameters.xhtml
#     icmp_options {
#       type = 3
#       code = 4
#     }
#   }

#   ingress_security_rules {
#     description = "Allow ICMP  Unreachable from Subnet"
#     stateless   = false
#     source      = var.cidr_block
#     source_type = "CIDR_BLOCK"
#     # Get protocol numbers from https://www.iana.org/assignments/protocol-numbers/protocol-numbers.xhtml ICMP is 1  
#     protocol = "1"

#     # For ICMP type and code see: https://www.iana.org/assignments/icmp-parameters/icmp-parameters.xhtml
#     icmp_options {
#       type = 3
#     }
#   }
# }