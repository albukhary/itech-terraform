terraform {
  backend "s3" {
    bucket = "itech-part3-state"
    key = "us-east-1/vpc/terraform.tfstate"
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

module "vpc" {
  source = "../../modules/vpc"
}