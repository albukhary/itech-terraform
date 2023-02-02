module "s3-demo" {
    source = "../../modules/s3"

    bucket_name = var.bucket_name
    num_bucket = var.num_bucket
    region = var.region
    acl_value = var.acl_value
}