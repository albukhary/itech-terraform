variable "AWS_REGION" {
    default = "us-east-1"
}

variable "AMI" {
    type = string
    default = "ami-0c2a1acae6667e438"
}

variable "key-pair" {
    default = "itech-aws"
}

variable "EC2_USER" {
    default = "ubuntu"
}

variable "PRIVATE_KEY_PATH" {
    default = "~/.ssh/itech-aws.pem"
}

variable "public_subnet_id" {
  
}

variable "database_subnet_id" {
  
}

variable "private_subnet_id" {
  
}

variable "bastion_sg_id" {
  
}

variable "public_sg_id" {
  
}

variable "database_sg_id" {
  
}

variable "private_sg_id" {
  
}

