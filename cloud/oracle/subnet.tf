resource "oci_core_subnet" "subnet" {
  vcn_id         = oci_core_vcn.vcn.id
  compartment_id = var.compartment_ocid
  cidr_block     = var.subnet_cidr_block
  dns_label      = var.subnet_dns_label
}
