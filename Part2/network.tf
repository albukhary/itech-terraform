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

# Our Private subnet can reach internet
# Make the Internet (all addresses) to be outbound reachable 
# from `Private-ec2` for purposes software update. 
# Use NAT Gateway for this

# NAT Gateway with Elastic IP
# Create 
# - Elastic IP, and then 
# - NAT gateway associated with the private subnet
# - Routing table which routes everything to NAT gateway
resource "aws_eip" "nat_gateway" {
  vpc = true
}

resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.nat_gateway.id
  subnet_id = aws_subnet.public.id
  tags = {
    "Name" = "NatGateway"
  }
}

resource "aws_route_table" "instance" {
  vpc_id = aws_vpc.VPC.id
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gateway.id
  }
}

resource "aws_route_table_association" "instance" {
  subnet_id = aws_subnet.private.id
  route_table_id = aws_route_table.instance.id
}