output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "vpc_cird" {
  value = aws_vpc.vpc.cidr_block
}

output "subnet1_id" {
  value = aws_subnet.part3-1.id
}

output "subnet2_id" {
  value = aws_subnet.part3-2.id
}