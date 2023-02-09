variable "aws_region" {
    default = "us-east-1"
}

variable "dynamodb_table" {
    default = "part3-tfstate-lock"
}

variable "state_bucket" {
    default = "itech-part3-state"
}