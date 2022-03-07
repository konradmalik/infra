resource "oci_core_subnet" "subnet" {
  compartment_id = var.compartment_ocid
  vcn_id         = var.vcn_ocid
  cidr_block     = var.cidr_block
}
