output "bucket_id" {
  value       = join("", aws_s3_bucket.temps3.*.id)
  description = "Bucket Name (aka ID)"
}

output "bucket_arn" {
  value       =  join("", aws_s3_bucket.temps3.*.arn)
  description = "Bucket ARN"
}