terraform {
  backend "s3" {
    bucket = "konradmalik-infra"
    key    = "terraform-state/cloudflare"
    region = "eu-central-1"
  }
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "4.43.0"
    }
  }
}

provider "cloudflare" {
  email   = var.cloudflare_email
  api_key = var.cloudflare_token
}
