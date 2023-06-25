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