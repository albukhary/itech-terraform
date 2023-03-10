resource "aws_vpc" "VPC" {
    cidr_block = "10.0.0.0/16"
    enable_dns_support = true
    enable_dns_hostnames = true
    instance_tenancy = "default"

    tags = {
      "Name" = "VPC"
    }
}

resource "aws_subnet" "public" {
    vpc_id = aws_vpc.VPC.id
    cidr_block = "10.0.1.0/24"
    map_public_ip_on_launch = true
    availability_zone = "us-east-1a"
    tags = {
        "Name" = "public"
    }
}
resource "aws_subnet" "private" {
    vpc_id = aws_vpc.VPC.id
    cidr_block = "10.0.2.0/24"
    map_public_ip_on_launch = false
    availability_zone = "us-east-1a"
    tags = {
        "Name" = "private"
    }
}

resource "aws_subnet" "database" {
    vpc_id = aws_vpc.VPC.id
    cidr_block = "10.0.3.0/24"
    map_public_ip_on_launch = false
    availability_zone = "us-east-1a"
    tags = {
        "Name" = "database"
    }
}