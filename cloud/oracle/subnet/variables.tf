variable "compartment_id" {
  description = "The OCID of the compartment containing the instance."
  type        = string
}

variable "vcn_id" {
  description = "The OCID of the VCN to contain the subnet."
  type        = string
}

variable "cidr_block" {
  description = "The CIDR IP address range of the subnet."
  type        = string
  default     = "10.0.0.0/24"
}
