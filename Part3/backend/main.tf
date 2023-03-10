terraform {
  backend "s3" {
    bucket = "itech-part3-state"
    key = "backend/terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "part3-tfstate-lock"
    encrypt = true
  }
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "4.53.0"
    }
  }
  required_version = ">= 1.0.2"
}

provider "aws" {
    region = var.aws_region
    default_tags {
      tags = {
        "Environment" = "Development"
        "Team" = "iTech-DevOps"
        "DevelopedBy" = "Terraform"
        "Application" = "Terraform Backend"
        "OwnerEmail" = "lazizbekexclusive@gmail.com"
      }
    }    
}

# Create DynamoDB table to lock .tfstate files
resource "aws_dynamodb_table" "terraform_state_locks" {
    name = var.dynamodb_table
    billing_mode = "PAY_PER_REQUEST"
    hash_key = "LockID"
    attribute {
      name = "LockID"
      type = "S"
    }
    tags = {
      "Name" = var.dynamodb_table
      "Description" = "DynamoDB terraform table to lcok tfstate files"
    }
}

# Create s3 bucket to store .tfstate files
resource "aws_s3_bucket" "terraform_state" {
  bucket = var.state_bucket
  lifecycle {
    prevent_destroy = true
  }
  tags = {
    Name = var.state_bucket
    Description = "S3 remote terraform tfstate store"
  }
}

resource "aws_s3_bucket_public_access_block" "s3_access_block" {
  bucket = aws_s3_bucket.terraform_state.id
  block_public_acls = true
  block_public_policy = true
  ignore_public_acls = true
  restrict_public_buckets = true
}
