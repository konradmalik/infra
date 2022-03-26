terraform {
  required_version = ">= 1.0.0"
  required_providers {
    b2 = {
      source = "Backblaze/b2"
    }
  }

  backend "s3" {
    bucket = "konrad-terraform-states"
    key    = "private/backblaze"
    region = "eu-central-1"
  }
}

provider "b2" {
}

resource "b2_bucket" "devarch" {
  bucket_name = "devarch"
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

resource "b2_application_key" "devarch_key" {
  key_name  = "devarch-key"
  bucket_id = b2_bucket.devarch.id
  capabilities = ["deleteFiles", "listAllBucketNames",
    "listBuckets", "listFiles", "readBucketEncryption",
    "readBuckets", "readFiles", "shareFiles",
  "writeBucketEncryption", "writeFiles"]
}

data "b2_application_key" "devarch_key" {
  key_name = b2_application_key.devarch_key.key_name
}

output "application_key" {
  value     = b2_application_key.devarch_key
  sensitive = true
}
