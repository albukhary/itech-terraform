resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.VPC.id
    tags = {
      Name = "igw"
    }  
}

resource "aws_route_table" "public-crt" {
    vpc_id =   aws_vpc.VPC.id
    route {
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_internet_gateway.igw.id
    }

    tags = {
      "Name" = "public-crt"
    }
}

resource "aws_route_table_association" "crta-public-subnet" {
    subnet_id = aws_subnet.public.id
    route_table_id = aws_route_table.public-crt.id
}