terraform {
  required_version = ">= 1.3.6"
  required_providers {
    b2 = {
      source  = "Backblaze/b2"
      version = "0.8.4"
    }
  }

  backend "s3" {
    bucket = "konradmalik-infra"
    key    = "terraform-state/backblaze"
    region = "eu-central-1"
  }
}

provider "b2" {
}

resource "b2_bucket" "backups" {
  bucket_name = "backups-km"
  bucket_type = "allPrivate"

  file_lock_configuration {
    is_file_lock_enabled = false
  }

  default_server_side_encryption {
    mode      = "SSE-B2"
    algorithm = "AES256"
  }

  lifecycle_rules {
    file_name_prefix             = ""
    days_from_hiding_to_deleting = 7
  }
}

resource "b2_application_key" "backups_key" {
  key_name  = "backups-key"
  bucket_id = b2_bucket.backups.id
  capabilities = ["deleteFiles", "listAllBucketNames",
    "listBuckets", "listFiles", "readBucketEncryption",
    "readBuckets", "readFiles", "shareFiles",
  "writeBucketEncryption", "writeFiles"]
}

output "application_key" {
  value     = b2_application_key.backups_key
  sensitive = true
}
