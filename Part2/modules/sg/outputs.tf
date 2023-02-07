output "bastion_sg_id" {
    value = aws_security_group.SG-Bastion.id
}

output "public_sg_id" {
    value = aws_security_group.SG-Public.id
}

output "private_sg_id" {
    value = aws_security_group.SG-Private.id
}

output "database_sg_id" {
    value = aws_security_group.SG-Database.id
}