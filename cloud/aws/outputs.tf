output "bucket_name" {
  description = "The name of the s3 bucket."
  value       = join("", aws_s3_bucket.default.*.bucket)
}

output "bucket_id" {
  description = "The id of the s3 bucket."
  value       = join("", aws_s3_bucket.default.*.id)
}

output "bucket_arn" {
  description = "The ARN of the s3 bucket."
  value       = join("", aws_s3_bucket.default.*.arn)
}

output "bucket_region" {
  value       = join("", aws_s3_bucket.default.*.region)
  description = "Bucket region"
}
