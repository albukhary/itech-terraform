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
}