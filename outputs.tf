output "all-availability-domains-in-your-tenancy" {
  value = data.oci_identity_availability_domains.ads.availability_domains
}


output "compartment-name" {
  value = oci_identity_compartment.tf_compartment.name
}

output "compartment-OCID" {
  value = oci_identity_compartment.tf_compartment.id
}


# Outputs for the vcn module

output "vcn_id" {
  description = "OCID of the VCN that is created"
  value       = module.vcn.vcn_id
}
output "id-for-route-table-that-includes-the-internet-gateway" {
  description = "OCID of the internet-route table. This route table has an internet gateway to be used for public subnets"
  value       = module.vcn.ig_route_id
}

output "public-subnet-id" {
  description = "OCID of the public subnet"
  value       = module.vcn.subnet_id
}
# output "nat-gateway-id" {
#   description = "OCID for NAT gateway"
#   value = module.vcn.nat_gateway_id
# }
# output "id-for-for-route-table-that-includes-the-nat-gateway" {
#   description = "OCID of the nat-route table - This route table has a nat gateway to be used for private subnets. This route table also has a service gateway."
#   value = module.vcn.nat_route_id
# }

# Outputs for pubic security list
output "network_security_group_main_id" {
  description = "OCID of the main network security group"
  value       = oci_core_network_security_group.main_network_security_group.id
}

# Outputs for compute instance

output "public-ip-for-compute-instance" {
  value = oci_core_instance.ubuntu_instance.public_ip
}
output "instance-name" {
  value = oci_core_instance.ubuntu_instance.display_name
}

output "instance-OCID" {
  value = oci_core_instance.ubuntu_instance.id
}

output "instance-region" {
  value = oci_core_instance.ubuntu_instance.region
}

output "instance-shape" {
  value = oci_core_instance.ubuntu_instance.shape
}

output "instance-state" {
  value = oci_core_instance.ubuntu_instance.state
}

output "instance-OCPUs" {
  value = oci_core_instance.ubuntu_instance.shape_config[0].ocpus
}

output "instance-memory-in-GBs" {
  value = oci_core_instance.ubuntu_instance.shape_config[0].memory_in_gbs
}

output "time-created" {
  value = oci_core_instance.ubuntu_instance.time_created
}