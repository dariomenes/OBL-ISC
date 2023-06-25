output "aws_vpc_id" {
  value = aws_vpc.vpc-OBL.id
}

output "id-subnet-1" {
  value = aws_subnet.OBL-public-subnet.id
}

output "id-subnet-2" {
  value = aws_subnet.OBL-public-subnet-2.id
}