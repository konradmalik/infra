variable "compartment_ocid" {
  description = "The OCID of the compartment containing the instance."
  type        = string
}

variable "cidr_blocks" {
  description = "The CIDR IP address range of the subnet."
  type        = list(string)
}

variable "dns_label" {
  description = "A DNS label for the VCN, used in conjunction with the VNIC's hostname and subnet's DNS label to form a fully qualified domain name (FQDN) for each VNIC within this subnet."
  type        = string
}

variable "internet_gateway_enabled" {
  description = "Should the internet gateway be enabled upon start?"
  type        = bool
}

variable "internet_gateway_destination" {
  description = "Conceptually, this is the range of IP addresses used for matching when routing traffic."
  type        = string
  default     = "0.0.0.0/0"
}

variable "internet_gateway_destination_type" {
  description = "Type of destination for the rule."
  type        = string
  default     = "CIDR_BLOCK"
}
