variable "compartment_ocid" {
  description = "The OCID of the compartment containing the instance."
  type        = string
}

variable "vcn_ocid" {
  description = "The OCID of the VCN to contain the subnet."
  type        = string
}

variable "cidr_block" {
  description = "The CIDR IP address range of the subnet."
  type        = string
  default     = "10.0.0.0/24"
}

variable "dns_label" {
  description = "A DNS label for the subnet, used in conjunction with the VNIC's hostname and VCN's DNS label to form a fully qualified domain name (FQDN) for each VNIC within this subnet."
  type        = string
}
