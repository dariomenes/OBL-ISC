###################################
### Recurso y EKS               ### 
###################################

resource "aws_eks_cluster" "cluster" {
  name     = "kluster"
  role_arn = "arn:aws:iam::649964628774:role/LabRole"

  vpc_config {
    subnet_ids = [
      aws_subnet.OBL-public-subnet.id,
      aws_subnet.OBL-public-subnet-2.id    
    ]
    security_group_ids = [aws_security_group.eks_nodes.id ]
  }

  tags = {
    Name        = "OBL-node-sg"
    #"kubernetes.io/cluster/OBL-cluster" = "owned"
    #"kubernetes.io/role/elb" = "1"
  }
}

# EKS Cluster Security Group
resource "aws_security_group" "eks_cluster" {
  name        = "OBL-cluster-sg"
  description = "Cluster communication with worker nodes"
  vpc_id      = aws_vpc.vpc-OBL.id

  tags = {
    Name = "cluster-sg"
  }
}

# EKS Node Security Group abajo se le agregar reglas ####
resource "aws_security_group" "eks_nodes" {
  name        = "OBL-node-sg"
  description = "Security group for all nodes in the cluster"
  vpc_id      = aws_vpc.vpc-OBL.id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

    tags = {
    Name        = "OBL-node-sg"
    #"kubernetes.io/cluster/kluster" = "owned"
    
  }

}

##########################################
#### Reglas SG para entrada y salida #####
##########################################

resource "aws_security_group_rule" "cluster_inbound" {
  description              = "Allow worker nodes to communicate with the cluster API Server"
  from_port                = 0
  protocol                 = "tcp"
  security_group_id        = aws_security_group.eks_cluster.id
  source_security_group_id = aws_security_group.eks_nodes.id
  to_port                  = 0
  type                     = "ingress"
}

resource "aws_security_group_rule" "cluster_outbound" {
  description              = "Allow cluster API Server to communicate with the worker nodes"
  from_port                = 0
  protocol                 = "tcp"
  security_group_id        = aws_security_group.eks_cluster.id
  source_security_group_id = aws_security_group.eks_nodes.id
  to_port                  = 0
  type                     = "egress"
}


###########################################
##### Creamos los  Group Nodes publicos ###
###########################################


resource "aws_eks_node_group" "public-nodes" {
  cluster_name    = aws_eks_cluster.cluster.name
  node_group_name = "OBL-nodes"
  node_role_arn   = "arn:aws:iam::649964628774:role/LabRole"

  subnet_ids = [
    aws_subnet.OBL-public-subnet.id,
    aws_subnet.OBL-public-subnet-2.id
  ]

  capacity_type  = "ON_DEMAND"
  instance_types = ["t3.medium"]

  scaling_config {
    desired_size = 2
    max_size     = 2
    min_size     = 1
  }

  update_config {
    max_unavailable = 1
  }

  #labels = {
   # role = "public-nodes"
  #}
}


##################################################
#### SG para comunicacion interna entre nodos ####
##################################################


/* resource "aws_security_group_rule" "nodes_internal" {
  description              = "Allow nodes to communicate with each other"
  from_port                = 0
  protocol                 = "-1"
  security_group_id        = aws_security_group.eks_nodes.id
  source_security_group_id = aws_security_group.eks_nodes.id
  to_port                  = 65535
  type                     = "ingress"
}

resource "aws_security_group_rule" "nodes_cluster_inbound" {
  description              = "Allow worker Kubelets and pods to receive communication from the cluster control plane"
  from_port                = 0
  protocol                 = "tcp"
  security_group_id        = aws_security_group.eks_nodes.id
  source_security_group_id = aws_security_group.eks_cluster.id
  to_port                  = 65535
  type                     = "ingress"
} */