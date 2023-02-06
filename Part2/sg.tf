resource "aws_security_group" "SG-Public" {
    vpc_id = aws_vpc.VPC.id
    egress {
        from_port = 0
        to_port = 0
        protocol = -1
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        description = "Allow ssh traffic from anywhere"
        from_port = 22
        to_port = 22
        protocol = "tcp"

        # TODO: Change it later to allow sh from private subnet only
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        description = "Allow HTTP traffic from anywhere"
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
      "Name" = "SG-Public"
    }
}