resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr
  enable_dns_support = true
  enable_dns_hostnames = true
  tags = {
    "Name" = var.vpc_name
  }
}

resource "aws_subnet" "part3-1" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = var.subnet1_cidr
  availability_zone = var.availability_zone_1
  tags = {
    "Name" = var.subnet1_name
  }
}

resource "aws_subnet" "part3-2" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = var.subnet2_cidr
  availability_zone = var.availability_zone_2
  tags = {
    "Name" = var.subnet2_name
  }
}

resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    "Name" = var.rt_name
  }
}

resource "aws_route_table_association" "rta-1" {
  subnet_id = aws_subnet.part3-1.id
  route_table_id = aws_route_table.rt.id
}

resource "aws_route_table_association" "rta-2" {
  subnet_id = aws_subnet.part3-2.id
  route_table_id = aws_route_table.rt.id
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    "Name" = var.igw_name
  }
}

resource "aws_route" "internet_route" {
  destination_cidr_block = var.all_cidr
  route_table_id = aws_route_table.rt.id
  gateway_id = aws_internet_gateway.igw.id
}