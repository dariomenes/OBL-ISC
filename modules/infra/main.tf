terraform {
        required_providers {
          aws = {
            source = "hashicorp/aws"
          }
          docker = {
            source  = "kreuzwerker/docker"
            version = "3.0.2"
    }
        }

}
output "cluster_endpoint" {
  value = aws_eks_cluster.cluster.endpoint
}