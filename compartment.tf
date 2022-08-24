resource "oci_identity_compartment" "tf_compartment" {
  # Required
  compartment_id = var.tenancy_ocid
  description    = "Compartment for CursedChat"
  name           = "cursed-chat"
}