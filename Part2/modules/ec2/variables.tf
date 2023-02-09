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

variable "PRIVATE_KEY_SOURCE_PATH" {
    default = "~/.ssh/itech-aws.pem"
}

variable "PRIVATE_KEY_DESTINATION_PATH" {
    default = "/home/ubuntu/.ssh/itech-aws.pem"
}

variable "script_path" {
    default = "script.sh"
}

variable "public_subnet_id" {
  
}

variable "instance_type" {
  
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

