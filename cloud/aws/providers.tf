terraform {
  required_version = ">= 1.3.6"
  required_providers {
    aws = {
      version = "5.38.0"
    }
  }

  backend "s3" {
    bucket = "konradmalik-infra"
    key    = "terraform-state/aws"
    region = "eu-central-1"
  }
}

provider "aws" {
  region = "eu-central-1"
}
