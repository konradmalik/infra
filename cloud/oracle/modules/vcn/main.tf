resource "oci_core_vcn" "vcn" {
  compartment_id = var.compartment_ocid
  cidr_blocks    = var.cidr_blocks
  dns_label      = var.dns_label
}

resource "oci_core_internet_gateway" "vcn_internet_gateway" {
  compartment_id = var.compartment_ocid
  vcn_id         = oci_core_vcn.vcn.id

  enabled = var.internet_gateway_enabled
}

resource "oci_core_default_route_table" "default-route-table" {
  manage_default_resource_id = oci_core_vcn.vcn.default_route_table_id

  route_rules {
    network_entity_id = oci_core_internet_gateway.vcn_internet_gateway.id

    destination      = var.internet_gateway_destination
    destination_type = var.internet_gateway_destination_type
  }
}
