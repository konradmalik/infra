resource "oci_core_vcn" "vcn" {
  compartment_id = var.compartment_ocid
  cidr_blocks    = var.vcn_cidr_blocks
  dns_label      = var.vcn_dns_label
  freeform_tags  = var.freeform_tags
}

resource "oci_core_internet_gateway" "vcn_internet_gateway" {
  compartment_id = var.compartment_ocid
  vcn_id         = oci_core_vcn.vcn.id

  enabled       = true
  freeform_tags = var.freeform_tags
}

resource "oci_core_default_route_table" "default-route-table" {
  manage_default_resource_id = oci_core_vcn.vcn.default_route_table_id

  route_rules {
    network_entity_id = oci_core_internet_gateway.vcn_internet_gateway.id

    destination      = "0.0.0.0/0"
    destination_type = "CIDR_BLOCK"
  }
  freeform_tags = var.freeform_tags
}
