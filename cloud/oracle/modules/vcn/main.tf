resource "oci_core_vcn" "vcn" {
  compartment_id = var.compartment_ocid
  cidr_blocks    = [var.cidr_block]
  dns_label      = var.dns_label
}
