resource "aws_security_group" "SG-Bastion" {
    vpc_id = var.vpc_id
    egress {
        from_port = 0
        to_port = 0
        protocol = -1
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        description = "Allow ping"
        from_port = -1
        to_port = -1
        protocol = "ICMP"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        description = "Allow ssh from my computer"
        from_port = 22
        to_port = 22
        protocol = "tcp"

        # Allow ssh for my computer
        cidr_blocks = ["${var.my_ip}"]
    }
    tags = {
      "Name" = "SG-Bastion"
    }
}

resource "aws_security_group" "SG-Public" {
    vpc_id = var.vpc_id
    egress {
        from_port = 0
        to_port = 0
        protocol = -1
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        description = "Allow ping"
        from_port = -1
        to_port = -1
        protocol = "ICMP"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        description = "Allow ssh traffic from bastion"
        from_port = 22
        to_port = 22
        protocol = "tcp"

        # Allow ssh from Bastion only
        security_groups = [ "${aws_security_group.SG-Bastion.id}" ]
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

resource "aws_security_group" "SG-Private" {
    vpc_id = var.vpc_id
    egress {
        from_port = 0
        to_port = 0
        protocol = -1
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        description = "Allow ping"
        from_port = -1
        to_port = -1
        protocol = "ICMP"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        description = "Allow ssh traffic from Bastion"
        from_port = 22
        to_port = 22
        protocol = "tcp"

        # Allow ssh from Bastion only
        security_groups = [ "${aws_security_group.SG-Bastion.id}" ]
    }
    tags = {
      "Name" = "SG-Private"
    }
}

resource "aws_security_group" "SG-Database" {
    vpc_id = var.vpc_id
    ingress {
        description = "Allow ping"
        from_port = -1
        to_port = -1
        protocol = "ICMP"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        description = "Allow ssh traffic from Private Security Group"
        from_port = 22
        to_port = 22
        protocol = "tcp"

        # Allow ssh from Private security group only
        security_groups = [ "${aws_security_group.SG-Private.id}" ]
    }
    tags = {
      "Name" = "SG-Database"
    }
}