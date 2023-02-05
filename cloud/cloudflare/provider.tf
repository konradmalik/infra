terraform {
  backend "s3" {
    bucket = "konradmalik-infra"
    key    = "terraform-state/cloudflare"
    region = "eu-central-1"
  }
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 3"
    }
  }
}

provider "cloudflare" {
}
