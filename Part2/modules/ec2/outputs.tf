output "bastion_instance_ip" {
    value = aws_instance.Bastion.public_ip
}

output "public_instance_ip" {
    value = aws_instance.Public-ec2.public_ip
}

output "private_instance_ip" {
    value = aws_instance.Private-ec2.private_ip
}

output "database_instance_ip" {
    value = aws_instance.Database.private_ip
}