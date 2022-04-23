locals {
  s3name                      = var.bucket_name != null ? var.bucket_name : "${var.teamid}-${var.prjid}"
  public_access_block_enabled = var.block_public_acls || var.block_public_policy || var.ignore_public_acls || var.restrict_public_buckets
  attach_policy               = var.attach_policy
}
