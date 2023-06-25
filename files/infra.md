# Resume Modulo Infra
## Modules

Necesario Red para continuar

## Resources

| Name | Type |
|------|------|
| [aws_eks_cluster.cluster](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eks_cluster) | resource |
| [aws_eks_node_group.public-nodes](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eks_node_group) | resource |
| [aws_security_group.eks_cluster](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group.eks_nodes](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group_rule.cluster_inbound](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.cluster_outbound](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_iam_role.labrole](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_role) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ami_typeNodos"></a> [ami\_typeNodos](#input\_ami\_typeNodos) | Tipo de AMI para el Nodo | `string` | n/a | yes |
| <a name="input_capacidadNodo"></a> [capacidadNodo](#input\_capacidadNodo) | Capacidad de los nodos | `string` | n/a | yes |
| <a name="input_id-subnet-1"></a> [id-subnet-1](#input\_id-subnet-1) | ID del Subnet 1 | `string` | n/a | yes |
| <a name="input_id-subnet-2"></a> [id-subnet-2](#input\_id-subnet-2) | ID del Subnet 2 | `string` | n/a | yes |
| <a name="input_identity_vpc"></a> [identity\_vpc](#input\_identity\_vpc) | Para saber el Output ID de la VPC | `string` | n/a | yes |
| <a name="input_instancia_deNodo"></a> [instancia\_deNodo](#input\_instancia\_deNodo) | Tipo de instancia para el Nodo | `string` | n/a | yes |
| <a name="input_nombre_NodoSG"></a> [nombre\_NodoSG](#input\_nombre\_NodoSG) | Nombre del SG para el Nodo | `string` | n/a | yes |
| <a name="input_nombre_cluster"></a> [nombre\_cluster](#input\_nombre\_cluster) | Nombre de EKS | `string` | n/a | yes |
| <a name="input_nombre_clusterSG"></a> [nombre\_clusterSG](#input\_nombre\_clusterSG) | Nombre del Cluster | `string` | n/a | yes |
| <a name="input_nombre_grupoNodos"></a> [nombre\_grupoNodos](#input\_nombre\_grupoNodos) | Nombre del grupo de nodos | `string` | n/a | yes |
| <a name="input_tag_cluster"></a> [tag\_cluster](#input\_tag\_cluster) | Nombre del Cluster | `string` | n/a | yes |
| <a name="input_tag_clusterSG"></a> [tag\_clusterSG](#input\_tag\_clusterSG) | Nombre del Cluster | `string` | n/a | yes |
| <a name="input_tag_nodoSG"></a> [tag\_nodoSG](#input\_tag\_nodoSG) | Nombre del Cluster | `string` | n/a | yes |

## Explicación del código
* cluster.tf
```javascript
###################################
###        Recurso y EKS        ### 
###################################
resource "aws_eks_cluster" "cluster" {
  name     = var.nombre_cluster
  role_arn = data.aws_iam_role.labrole.arn

  vpc_config {
    subnet_ids = [
      var.id-subnet-1,
      var.id-subnet-2    
    ]
    security_group_ids = [aws_security_group.eks_nodes.id ]
  }

  tags = {
    Name        = var.tag_cluster
  }
}
########################################
#   Grupo de seguridad del Cluster     #
########################################
resource "aws_security_group" "eks_cluster" {
  name        = var.nombre_clusterSG
  description = "Comunicacion con los workers nodes"
  vpc_id      = var.identity_vpc

  tags = {
    Name = var.tag_clusterSG
  }
}
###########################################################
###              Regla de salida del EKS               ####
###########################################################
resource "aws_security_group" "eks_nodes" {
  name        = var.nombre_NodoSG
  description = "Grupo de seguridad para los nodos"
  vpc_id      =  var.identity_vpc

  egress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
    tags = {
    Name        = var.tag_nodoSG
  }
}
##########################################
####    Comunicacion entre nodos     #####
##########################################
resource "aws_security_group_rule" "cluster_inbound" {
  description              = "Permitir que los worker nodes se comuniquen con el servidor API del cluster"
  from_port                = 443
  protocol                 = "tcp"
  security_group_id        = aws_security_group.eks_cluster.id
  source_security_group_id = aws_security_group.eks_nodes.id
  to_port                  = 443
  type                     = "ingress"
}
resource "aws_security_group_rule" "cluster_outbound" {
  description              = "Permitir que el cluster se comunique con los worker nodes en cierto rango de puertos"
  from_port                = 3550
  protocol                 = "tcp"
  security_group_id        = aws_security_group.eks_cluster.id
  source_security_group_id = aws_security_group.eks_nodes.id
  to_port                  = 50051
  type                     = "egress"
}

###########################################
###        Creamos los Nodos            ###
###########################################
resource "aws_eks_node_group" "public-nodes" {
  cluster_name    = aws_eks_cluster.cluster.name
  node_group_name = var.nombre_grupoNodos
  node_role_arn   = data.aws_iam_role.labrole.arn

  subnet_ids = [
      var.id-subnet-1,
      var.id-subnet-2 
  ]
  ami_type = var.ami_typeNodos
  capacity_type  = var.capacidadNodo
  instance_types = [var.instancia_deNodo]
  scaling_config {
    desired_size = 2
    max_size     = 2
    min_size     = 2
  }
  update_config {
    max_unavailable = 1
  }
}
```
* output.tf
```javascript
###########################################
#### Extraer el LabRole de esta cuenta ####
###########################################
data "aws_iam_role" "labrole" {
  name = "Labrole"
}
```
* variables.tf
```javascript
##### Variables locales del modulo INFRA #####
```
***
#### Anexo - recursos externos

<https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eks_cluster>

<https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eks_node_group>

<https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule>

<https://medium.com/devops-mojo/terraform-provision-amazon-eks-cluster-using-terraform-deploy-create-aws-eks-kubernetes-cluster-tf-4134ab22c594>

[Ir al índice](OBL-ISC/README.md)
