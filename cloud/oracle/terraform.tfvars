# private oci stuff in .envrc
region = "eu-frankfurt-1"

ocpus                    = 4
memory_in_gbs            = 24
boot_volume_size_in_gbs  = 200
hostname                 = "ampere-a1"
availability_domain      = "Atgs:EU-FRANKFURT-1-AD-2"
operating_system         = "Canonical Ubuntu"
operating_system_version = "20.04"
vcn_dns_label            = "dev"
subnet_dns_label         = "vms"

# ~/.ssh/private.pub
ssh_authorized_keys = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDFDhFYFITq/ZGQWq3hBz7Q++/cuxOiJ4l08L/DROuxIjw+C+OIFY6caMLUIMn68AdwL1tY7zySKk48Os70WE4vdCD1ox3s+PMCmK6pufugD3Wbba7E796oecWcPbyOfeXr6hLS5taJkIUZcR8GhGQYZpb+7mzWVht6TqWcRbXmfMkX9TIOK+maUa0hYS4JPx/ew318PMBJOQwlM8nx0BVDtCMOofh1E5xCMmEdUWzE2AdnDdTSe2zWHzqc5pdQnhfTwjZGnxFr38WuFJcNfKNDnA1N3LXCIhW3hqSztg3HnMPMH8bdH3ghDl4yzxNbNRwxkjmR7B/DcvAl/dlC/+KS9lAJJpuJmyp+ydPNtVkjUAMgq+F3ZC1FZ1l/QtPVYe43v5P+Oes5yyw2XFJncSEBLKb1vw8JqI8tFVikyUrriXw/lB61Qw2NIDzUfPmvH5Ns0q50+0jSe+XO7lAr7R2/uxD94BYizdNVQCQ2d1pQ/1OISOGAettZMk16M9r5w/E= konrad@x1c6"
assign_public_ip    = true
assign_ipv6_address = false
