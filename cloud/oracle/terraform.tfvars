# private oci stuff in .envrc
region = "eu-frankfurt-1"

ocpus                    = 4
memory_in_gbs            = 24
boot_volume_size_in_gbs  = 200
hostname                 = "ampere-a1"
availability_domain      = "cAmo:EU-FRANKFURT-1-AD-1"
operating_system         = "Canonical Ubuntu"
operating_system_version = "20.04"

ssh_authorized_keys = "~/.ssh/private.pub"
assign_public_ip    = true
assign_ipv6_address = false
