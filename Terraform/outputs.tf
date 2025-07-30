output "vpc_id" {
  value = aws_vpc.vpc-1.id
}

output "vpc_cidr_block" {
  value = aws_vpc.vpc-1.cidr_block
}

output "security_group_id" {
  value = aws_security_group.sg-1.id
}

output "igw_id" {
  value = aws_internet_gateway.gw.id
}


output "ec2_public_ip_1" {
  value = aws_instance.my-ec2-apache[0].public_ip
}

output "ec2_public_ip_2" {
  value = aws_instance.my-ec2-apache[1].public_ip
}

output "ec2_public_ip_3" {
  value = aws_instance.my-ec2-apache[2].public_ip
}

