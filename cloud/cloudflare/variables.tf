variable "cloudflare_email" {
  description = "cloudflare email"
  type        = string
  sensitive   = true
}

variable "cloudflare_token" {
  description = "cloudflare api key/token"
  type        = string
  sensitive   = true
}
