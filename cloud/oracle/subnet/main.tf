resource "oci_core_subnet" "dev" {
    cidr_block = var.subnet_cidr_block
    compartment_id = var.compartment_id
    vcn_id = var.vcn_id
}

