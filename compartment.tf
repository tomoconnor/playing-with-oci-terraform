resource "oci_identity_compartment" "tf_compartment" {
  # Required
  compartment_id = var.tenancy_ocid
  description    = format("Compartment for %s", var.component_name)
  name           = var.component_name
}