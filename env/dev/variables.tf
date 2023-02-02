variable "bucket_name" {
    description = "Base bucket name"
}

variable "num_bucket" {
    description = "Number of s3 buckets to create"
}

variable "region" {
    description = "Specify the region where your buckets will be created"
}

variable "acl_value" {
    description = "Provide value for the ACL"
}