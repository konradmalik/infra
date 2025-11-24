terraform {
  backend "s3" {
    bucket = "konradmalik-infra"
    key    = "terraform-state/cloudflare"
    region = "eu-central-1"
  }
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "5.13.0"
    }
  }
}

provider "cloudflare" {
  email   = var.cloudflare_email
  api_key = var.cloudflare_token
}
