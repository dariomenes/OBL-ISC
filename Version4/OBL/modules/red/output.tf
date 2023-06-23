### Outputs propios del modulo RED###
/* output "ec2-id" {
  value = aws_instance.OBL-instance.id
}

/* output "lb-ip" {
  value = aws_eks_cluster.cluster.name
} */



### Extraer los ID de la VPC y Subred ###

output "aws_vpc_id" {
  value = aws_vpc.vpc-OBL.id
}

output "id-subnet-1" {
  value = aws_subnet.OBL-public-subnet.id
}

output "id-subnet-2" {
  value = aws_subnet.OBL-public-subnet-2.id
}