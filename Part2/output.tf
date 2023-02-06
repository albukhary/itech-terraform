output "private_ec2_private_ip" {
  value = aws_instance.Private-ec2.private_ip
}

output "private_ec2_nat_gateway_ip" {
  value = aws_eip.nat_gateway.public_ip
}