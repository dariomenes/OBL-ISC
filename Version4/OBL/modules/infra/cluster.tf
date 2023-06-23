###################################
### Recurso y EKS               ### 
###################################

resource "aws_eks_cluster" "cluster" {
  name     = var.nombre_cluster
  role_arn = data.aws_iam_role.labrole.arn #"arn:aws:iam::649964628774:role/LabRole"

  vpc_config {
    subnet_ids = [
      var.id-subnet-1,
      var.id-subnet-2    
    ]
    security_group_ids = [aws_security_group.eks_nodes.id ]
  }

  tags = {
    Name        = "OBL-Cluster"
  }
}

# EKS Cluster Security Group
resource "aws_security_group" "eks_cluster" {
  name        = "OBL-cluster-sg"
  description = "Cluster communication with worker nodes"
  vpc_id      = var.identity_vpc

  tags = {
    Name = "SG-Cluster"
  }
}

# EKS Node Security Group abajo se le agregar reglas ####
resource "aws_security_group" "eks_nodes" {
  name        = "OBL-node-sg"
  description = "Security group for all nodes in the cluster"
  vpc_id      =  var.identity_vpc

  egress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
    tags = {
    Name        = "SG-Nodo"
  }
}

##########################################
#### Comunicacion entre nodos y API #####
##########################################

resource "aws_security_group_rule" "cluster_inbound" {
  description              = "Allow worker nodes to communicate with the cluster API Server"
  from_port                = 443
  protocol                 = "tcp"
  security_group_id        = aws_security_group.eks_cluster.id
  source_security_group_id = aws_security_group.eks_nodes.id
  to_port                  = 443
  type                     = "ingress"
}

resource "aws_security_group_rule" "cluster_outbound" {
  description              = "Allow cluster API Server to communicate with the worker nodes"
  from_port                = 3550
  protocol                 = "tcp"
  security_group_id        = aws_security_group.eks_cluster.id
  source_security_group_id = aws_security_group.eks_nodes.id
  to_port                  = 50051
  type                     = "egress"
}

###########################################
##### Creamos los  Group Nodes publicos ###
###########################################

resource "aws_eks_node_group" "public-nodes" {
  cluster_name    = aws_eks_cluster.cluster.name
  node_group_name = "OBL-nodes"
  node_role_arn   = data.aws_iam_role.labrole.arn #"arn:aws:iam::649964628774:role/LabRole"

  subnet_ids = [
      var.id-subnet-1,
      var.id-subnet-2 
  ]
  ami_type = "BOTTLEROCKET_x86_64"
  capacity_type  = "ON_DEMAND"
  instance_types = ["t3.medium"]
  scaling_config {
    desired_size = 2
    max_size     = 2
    min_size     = 2
  }
  update_config {
    max_unavailable = 1
  }
}