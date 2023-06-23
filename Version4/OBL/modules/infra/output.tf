/* output "cluster_endpoint" {
  value = aws_eks_cluster.cluster.endpoint
}

output "ec2-public-ip" {
  value = aws_instance.OBL-instance.public_ip
} */

#### Extraer el LabRole de esta cuenta ####
data "aws_iam_role" "labrole" {
  name = "Labrole"
}

#### Salida del Cluster Creado ####


###Salidas para el provider de kubernetes ###
output "eks_cluster" {
  value = aws_eks_cluster.cluster.endpoint
}
output "eks_certificado"{
  value = aws_eks_cluster.cluster.certificate_authority
}

#output "output_eks_cluster_endpoint" {
  #value = aws_eks_cluster.cluster.endpoint
#}

