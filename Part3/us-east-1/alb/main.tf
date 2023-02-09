terraform {
  backend "s3" {
    bucket = "itech-part3-state"
    key = "us-east-1/alb/terraform.tfstate"
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

data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "itech-part3-state"
    key = "us-east-1/vpc/terraform.tfstate"
    region = "us-east-1"
  }
}

data "terraform_remote_state" "compute" {
  backend = "s3"
  config = {
    bucket = "itech-part3-state"
    key = "us-east-1/compute/terraform.tfstate"
    region = "us-east-1"
  }
}

module "alb" {
  source = "../../modules/alb"
  vpc_id = data.terraform_remote_state.vpc.outputs.vpc_id
  subnet_ids = ["${data.terraform_remote_state.vpc.outputs.subnet1_id}", "${data.terraform_remote_state.vpc.outputs.subnet2_id}"]
  
  instance1_id = data.terraform_remote_state.compute.outputs.instance1_id
  instance2_id = data.terraform_remote_state.compute.outputs.instance2_id
  sg_id = data.terraform_remote_state.compute.outputs.sg_id
}