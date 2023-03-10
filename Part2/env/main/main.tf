terraform {
  backend "s3" {
    encrypt = true    
    bucket = "itech-part2-bucket"
    dynamodb_table = "terraform-state-lock-dynamo"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}

locals {
    my_ip = "188.113.199.9/32"
    dynamodb_table = "terraform-state-lock-dynamo"
    AWS_REGION = "us-east-1"
    AMI = "ami-0c2a1acae6667e438"

    EC2_USER = "ubuntu"
    PRIVATE_KEY_SOURCE_PATH = "~/.ssh/itech-aws.pem"
    key_pair = "itech-aws"

    ingress_cidr = "0.0.0.0/0"
    instance_type = "t2.micro"
}

module "dynamo" {
    source = "../../modules/dynamo"
    dynamodb_table = local.dynamodb_table
}

module "network" {
    source = "../../modules/network"
}

module "sg" {
    source = "../../modules/sg"
    my_ip = local.my_ip
    vpc_id = module.network.vpc_id
    ingress_cidr = local.ingress_cidr
}

module "ec2" {
    source = "../../modules/ec2"
    AWS_REGION = local.AWS_REGION
    AMI = local.AMI
    key-pair = local.key_pair
    instance_type = local.instance_type
    EC2_USER = local.EC2_USER
    PRIVATE_KEY_SOURCE_PATH = local.PRIVATE_KEY_SOURCE_PATH

    public_subnet_id = module.network.public_subnet_id
    database_subnet_id = module.network.database_subnet_id
    private_subnet_id = module.network.private_subnet_id

    bastion_sg_id = module.sg.bastion_sg_id
    public_sg_id = module.sg.public_sg_id
    database_sg_id = module.sg.database_sg_id
    private_sg_id = module.sg.private_sg_id
}