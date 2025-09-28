resource "cloudflare_zone" "konradmalik" {
  account = {
    id = "60a45beba2022b800a909a71b63cb5c5"
  }
  name = "konradmalik.com"
}

resource "cloudflare_dns_record" "root" {
  zone_id = cloudflare_zone.konradmalik.id
  name    = "@"
  type    = "CNAME"
  content = "konradmalik.github.io"
  ttl     = 1 # 1 means automatic
  proxied = true
}

resource "cloudflare_zone_setting" "konradmalik-tls" {
  zone_id    = cloudflare_zone.konradmalik.id
  setting_id = "tls_1_3"
  value      = "on"
}

resource "cloudflare_zone_setting" "konradmalik-ssl" {
  zone_id    = cloudflare_zone.konradmalik.id
  setting_id = "ssl"
  value      = "strict"
}

resource "cloudflare_page_rule" "https" {
  zone_id  = cloudflare_zone.konradmalik.id
  target   = "konradmalik.com/*"
  priority = 1

  actions = {
    always_use_https = true
  }
}
