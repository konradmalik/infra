# private oci stuff in .envrc
region           = "eu-frankfurt-1"
compartment_ocid = "ocid1.tenancy.oc1..aaaaaaaagtsjh7xz7ijesbzn3kkgqmf2t26jr7m4rvng4ooxnddlro73x77q"

ocpus                    = 4
memory_in_gbs            = 24
boot_volume_size_in_gbs  = 200
hostname                 = "ampere-a1"
availability_domain      = "Atgs:EU-FRANKFURT-1-AD-2"
operating_system         = "Canonical Ubuntu"
operating_system_version = "20.04"

vcn_dns_label     = "dev"
vcn_cidr_blocks   = ["10.0.0.0/16"]
subnet_dns_label  = "vms"
subnet_cidr_block = "10.0.1.0/24"

ssh_authorized_key_path = "~/.ssh/private.pub"
assign_public_ip        = true
assign_ipv6_address     = false
