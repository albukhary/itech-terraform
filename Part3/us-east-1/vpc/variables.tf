variable "aws_region" {
  default = "us-east-1"
}
variable "vpc_cidr" {
  default = "10.20.20.0/25"
}

variable "vpc_name" {
  default = "iTech-Part3-VPC"
}

variable "subnet1_cidr" {
  default = "10.20.20.0/26"
}

variable "subnet1_name" {
  default = "iTech-Part3-Private-1"
}

variable "subnet2_cidr" {
  default = "10.20.20.64/26"
}

variable "subnet2_name" {
  default = "iTech-Part3-Private-2"
}

variable "availability_zone" {
  default = "us-east-1"
}

variable "all_cidr" {
  default = "0.0.0.0/0"
}

variable "rt_name" {
  default = "iTech-Part3-Route-table"
}

variable "igw_name" {
  default = "iTech-Part3-Internet-Gateway"
}
