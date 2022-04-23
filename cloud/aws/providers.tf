terraform {
  required_version = ">= 1.0.1"
  required_providers {
    aws = {
      version = "4.11.0"
    }
  }

  backend "s3" {
    bucket = "konradmalik-infra"
    key    = "private/aws"
    region = "eu-central-1"
  }
}
provider "aws" {
  region = "eu-central-1"
}
