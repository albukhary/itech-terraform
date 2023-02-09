output "instance1_public_dns" {
  value = aws_instance.app-server1.public_dns
}

output "instance1_public_ip" {
  value = aws_instance.app-server1.public_ip
}

output "instance1_id" {
  value = aws_instance.app-server1.id
}

output "instance2_public_dns" {
  value = aws_instance.app-server2.public_dns
}

output "instance2_public_ip" {
  value = aws_instance.app-server2.public_ip
}

output "instance2_id" {
  value = aws_instance.app-server2.id
}

output "sg_id" {
  value = aws_security_group.http-sg.id
}