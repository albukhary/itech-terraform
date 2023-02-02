provider "aws" {
    shared_credentials_files = ["~/.aws/credentials"]
    region = "${var.region}"
}

resource "aws_s3_bucket" "temps3" {
    count = "${var.num_bucket}"
    bucket = "itech-${var.bucket_name}-${count.index}"
}

resource "aws_s3_bucket_acl" "temp-s3-acl" {
    count = "${var.num_bucket}"
    bucket = aws_s3_bucket.temps3[count.index].id
    acl = "${var.acl_value}" 
}
