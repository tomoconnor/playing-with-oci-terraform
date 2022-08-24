data "oci_core_images" "test_images" {
    #Required
    compartment_id = oci_identity_compartment.tf_compartment.id

    #Optional
    operating_system = "Canonical Ubuntu"
    operating_system_version = "22.04"
    shape = var.shape
    # state = var.image_state
    # sort_by = var.image_sort_by
    # sort_order = var.image_sort_order
}

output "oci_core_images_ubuntu_id" {
    value = data.oci_core_images.test_images.images[0].id
}
  