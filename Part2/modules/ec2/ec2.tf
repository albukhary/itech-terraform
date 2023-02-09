resource "aws_instance" "Bastion" {
    ami = var.AMI
    instance_type = var.instance_type
    # VPC
    subnet_id = "${var.public_subnet_id}"
    # Security Group
    vpc_security_group_ids = ["${var.bastion_sg_id}"]
    # the Public SSH key
    key_name = var.key-pair

    provisioner "file" {
      source = var.PRIVATE_KEY_SOURCE_PATH
      destination = var.PRIVATE_KEY_DESTINATION_PATH
      connection {
        type        = "ssh"
        user        = "ubuntu"
        private_key = "${file("${var.PRIVATE_KEY_SOURCE_PATH}")}"
        host        = "${self.public_ip}"
        script_path = "${var.script_path}"
      }
    }
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
    ami = var.AMI
    instance_type = var.instance_type
    # VPC
    subnet_id = "${var.public_subnet_id}"
    # Security Group
    vpc_security_group_ids = ["${var.public_sg_id}"]
    # the Public SSH key
    key_name = var.key-pair

    provisioner "file" {
      source = var.PRIVATE_KEY_SOURCE_PATH
      destination = var.PRIVATE_KEY_DESTINATION_PATH
      connection {
        type        = "ssh"
        user        = "ubuntu"
        private_key = "${file("${var.PRIVATE_KEY_SOURCE_PATH}")}"
        host        = "${self.public_ip}"
        script_path = "${var.script_path}"
      }
    }
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
    ami = var.AMI
    instance_type = var.instance_type
    # VPC
    subnet_id = "${var.database_subnet_id}"
    # Security Group
    vpc_security_group_ids = ["${var.database_sg_id}"]
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
    ami = var.AMI
    instance_type = var.instance_type
    # VPC
    subnet_id = "${var.private_subnet_id}"
    # Security Group
    vpc_security_group_ids = ["${var.private_sg_id}"]
    # the Public SSH key
    key_name = var.key-pair

    # provisioner "file" {
    #   source = var.PRIVATE_KEY_SOURCE_PATH
    #   destination = var.PRIVATE_KEY_DESTINATION_PATH
    #   connection {
    #     type        = "ssh"
    #     user        = "ubuntu"
    #     private_key = "${file("${var.PRIVATE_KEY_SOURCE_PATH}")}"
    #     # host        = "${self.private_ip}"
    #     # script_path = "${var.script_path}"
    #   }
    # }
    connection {
        user = "${var.EC2_USER}"
        private_key = "${file("${var.PRIVATE_KEY_PATH}")}"
        host = self.public_ip
    }

    tags = {
      "Name" = "Private-ec2"
    }
}