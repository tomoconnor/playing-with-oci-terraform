resource "oci_core_instance" "ubuntu_instance" {
    # Required
    availability_domain = data.oci_identity_availability_domains.ads.availability_domains[0].name
    compartment_id = oci_identity_compartment.tf_compartment.id
    shape = var.shape
    source_details {
        source_id = data.oci_core_images.test_images.images[0].id
        source_type = "image"
    }

    shape_config {
      ocpus = 4
      memory_in_gbs = 24
      
    }
    # Optional
    display_name = "cursed-chat-server"
    create_vnic_details {
        assign_public_ip = true
        subnet_id = module.vcn.subnet_id["pubic"]
        nsg_ids = [oci_core_network_security_group.main_network_security_group.id]
    }
    metadata = {
        ssh_authorized_keys = file("oci.pub")
    } 
    preserve_boot_volume = false
}