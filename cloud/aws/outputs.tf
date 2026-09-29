output "bucket_name" {
  description = "The name of the s3 bucket."
  value       = aws_s3_bucket.state.bucket
}

output "bucket_arn" {
  description = "The ARN of the s3 bucket."
  value       = aws_s3_bucket.state.arn
}
