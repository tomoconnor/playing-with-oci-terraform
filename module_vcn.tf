# Source from https://registry.terraform.io/modules/oracle-terraform-modules/vcn/oci/
module "vcn" {
  source  = "oracle-terraform-modules/vcn/oci"
  version = "3.5.0"
  # insert the 5 required variables here

  # Required Inputs
  compartment_id = oci_identity_compartment.tf_compartment.id
  region         = var.region

  internet_gateway_route_rules = null
  local_peering_gateways       = null
  nat_gateway_route_rules      = null

  # Optional Inputs
  vcn_name      = var.component_name
  vcn_dns_label = var.dns_name
  vcn_cidrs     = [var.cidr_block]

  create_internet_gateway = true
  create_nat_gateway      = false
  create_service_gateway  = false
  subnets = {
    public = {
      name = "pubic", 
      cidr_block = cidrsubnet(var.cidr_block, 8, 1),
    }
  }
}