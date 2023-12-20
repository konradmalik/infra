resource "cloudflare_zone" "konradmalik" {
  zone       = "konradmalik.com"
  account_id = "60a45beba2022b800a909a71b63cb5c5"
}

resource "cloudflare_record" "root" {
  zone_id = cloudflare_zone.konradmalik.id
  name    = "@"
  type    = "CNAME"
  value   = "konradmalik.github.io"
  proxied = true
}

resource "cloudflare_zone_settings_override" "konradmalik-settings" {
  zone_id = cloudflare_zone.konradmalik.id

  settings {
    tls_1_3 = "on"
    ssl     = "strict"
  }
}

resource "cloudflare_page_rule" "https" {
  zone_id  = cloudflare_zone.konradmalik.id
  target   = "konradmalik.com/*"
  priority = 1

  actions {
    always_use_https = true
  }
}
