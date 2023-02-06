resource "aws_instance" "Bastion" {
    ami = "${lookup(var.AMI, var.AWS_REGION)}"
    instance_type = "t2.micro"
    # VPC
    subnet_id = "${aws_subnet.public.id}"
    # Security Group
    vpc_security_group_ids = ["${aws_security_group.SG-Bastion.id}"]
    # the Public SSH key
    key_name = var.key-pair

    connection {
        user = "${var.EC2_USER}"
        private_key = "${file("${var.PRIVATE_KEY_PATH}")}"
        host = self.public_ip
    }

    tags = {
      "Name" = "Bastion"
    }
}

resource "aws_instance" "Public-ec2" {
    ami = "${lookup(var.AMI, var.AWS_REGION)}"
    instance_type = "t2.micro"
    # VPC
    subnet_id = "${aws_subnet.public.id}"
    # Security Group
    vpc_security_group_ids = ["${aws_security_group.SG-Public.id}"]
    # the Public SSH key
    key_name = var.key-pair

    connection {
        user = "${var.EC2_USER}"
        private_key = "${file("${var.PRIVATE_KEY_PATH}")}"
        host = self.public_ip
    }

    tags = {
      "Name" = "Public-ec2"
    }
}

resource "aws_instance" "Database" {
    ami = "${lookup(var.AMI, var.AWS_REGION)}"
    instance_type = "t2.micro"
    # VPC
    subnet_id = "${aws_subnet.database.id}"
    # Security Group
    vpc_security_group_ids = ["${aws_security_group.SG-Database.id}"]
    # the Public SSH key
    key_name = var.key-pair

    connection {
        user = "${var.EC2_USER}"
        private_key = "${file("${var.PRIVATE_KEY_PATH}")}"
        host = self.public_ip
    }
    tags = {
      "Name" = "Database"
    }
}

resource "aws_instance" "Private-ec2" {
    ami = "${lookup(var.AMI, var.AWS_REGION)}"
    instance_type = "t2.micro"
    # VPC
    subnet_id = "${aws_subnet.private.id}"
    # Security Group
    vpc_security_group_ids = ["${aws_security_group.SG-Private.id}"]
    # the Public SSH key
    key_name = var.key-pair

    connection {
        user = "${var.EC2_USER}"
        private_key = "${file("${var.PRIVATE_KEY_PATH}")}"
        host = self.public_ip
    }

    tags = {
      "Name" = "Private-ec2"
    }
}