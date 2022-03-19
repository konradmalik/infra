terraform {
  required_providers {
    oci = {
      source  = "oracle/oci"
      version = "4.68.0"
    }
  }
  backend "s3" {
    bucket = "konrad-terraform-states"
    key    = "private/oracle"
    region = "eu-central-1"
  }

}

provider "oci" {
  auth                = "SecurityToken"
  config_file_profile = "konradmalik"
  region              = var.region
}
