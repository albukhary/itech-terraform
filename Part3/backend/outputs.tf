output "s3_bucket_id" {
  value = aws_s3_bucket.terraform_state.id
  description = "Name of the S3 bucket where tfstate files are kept"
}

output "dynamodb_table_name" {
  value = aws_dynamodb_table.terraform_state_locks.name
  description = "Name of the DynamoDB table where tfstate files are locked"
}