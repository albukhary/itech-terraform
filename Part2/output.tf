output "bastion_instance_ip" {
    value = module.ec2.bastion_instance_ip
}

output "public_instance_ip" {
    value = module.ec2.public_instance_ip
}

output "private_instance_ip" {
    value = module.ec2.private_instance_ip
}

output "database_instance_ip" {
    value = module.ec2.database_instance_ip
}