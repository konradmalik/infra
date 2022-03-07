provider "oci" {
  tenancy_ocid         = var.tenancy_ocid
  user_ocid            = var.user_ocid
  fingerprint          = var.fingerprint
  private_key_path     = var.private_key_path
  private_key_password = var.private_key_password
  region               = var.region
}

module "vcn" {
  source = "./modules/vcn"

  compartment_ocid = var.compartment_ocid
}

module "subnet" {
  source = "./modules/subnet"

  vcn_ocid = module.vcn.vcn_ocid

  compartment_ocid = var.compartment_ocid
}

module "vm" {
  source = "./modules/vm"

  subnet_ocid = module.subnet.subnet_ocid

  compartment_ocid         = var.compartment_ocid
  ocpus                    = var.ocpus
  memory_in_gbs            = var.memory_in_gbs
  boot_volume_size_in_gbs  = var.boot_volume_size_in_gbs
  hostname                 = var.hostname
  availability_domain      = var.availability_domain
  operating_system         = var.operating_system
  operating_system_version = var.operating_system_version
  ssh_authorized_keys      = var.ssh_authorized_keys
  assign_public_ip         = var.assign_public_ip
  assign_ipv6_address      = var.assign_ipv6_address
}
