resource "cloudflare_zone" "konradmalik" {
  zone = "konradmalik.com"
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
    tls_1_3          = "on"
    ssl              = "strict"
    development_mode = "on"
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
