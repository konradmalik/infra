output "vcn_ocid" {
  description = "The OCID of the created vcn."
  value       = oci_core_vcn.vcn.id
}
