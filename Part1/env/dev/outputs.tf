output "bucket_id" {
  value       = module.s3-demo.bucket_id
  description = "Bucket Name (aka ID)"
}

output "bucket_arn" {
  value       =  module.s3-demo.bucket_arn
  description = "Bucket ARN"
}