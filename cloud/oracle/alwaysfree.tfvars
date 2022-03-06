ocpus = 4
memory_in_gbs = 24
boot_volume_size_in_gbs = 200
hostname = "ampere-a1"
# in .envrc
#compartment_id = ""
availability_domain = "AD-1"
operating_system = "Canonical Ubuntu"
operating_system_version = "20.04"

# TODO get this from subnet module output
subnet_id = ""
ssh_authorized_keys = "~/.ssh/private.pub"
assign_public_ip = true
assign_ipv6_address = false
nsg_ids = []
