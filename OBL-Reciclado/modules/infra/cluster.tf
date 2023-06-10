############################
## Creacion del IAM Rol ####
############################

/*  resource "aws_iam_role" "eks-cluster" {
  name = "eks-cluster-OBL-Deploy"

  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "eks.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY
} */

##############################################
## Attach de la Policy al recurso Kluster ####
## Respectivas Subnets                    ####
##############################################

/* resource "aws_iam_role_policy_attachment" "amazon-eks-cluster-policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.eks-cluster.name
} */

### Agregando nombre al kluster ### 
##Funciona####

resource "aws_eks_cluster" "cluster" {
  name     = "kluster"
  role_arn = "arn:aws:iam::649964628774:role/LabRole"

  vpc_config {
    subnet_ids = [
      aws_subnet.OBL-public-subnet.id,
      aws_subnet.OBL-public-subnet-2.id
    ]
  }

}


######################################
## Creacion del  IAM para el Nodo ####
######################################

/* resource "aws_iam_role" "nodes" {
  name = "eks-node-group-nodes"

  assume_role_policy = jsonencode({
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "ec2.amazonaws.com"
      }
    }]
    Version = "2012-10-17"
  })
} */

/* resource "aws_iam_role_policy_attachment" "amazon-eks-worker-node-policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = aws_iam_role.nodes.name
}

resource "aws_iam_role_policy_attachment" "amazon-eks-cni-policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role       = aws_iam_role.nodes.name
}

resource "aws_iam_role_policy_attachment" "amazon-ec2-container-registry-read-only" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = aws_iam_role.nodes.name
} */


##### Creacion del grupo de Nodos publicos ##### Problema con el LabRole

resource "aws_eks_node_group" "public-nodes" {
  cluster_name    = aws_eks_cluster.cluster.name
  node_group_name = "OBL-nodes"
  node_role_arn   = "arn:aws:iam::649964628774:role/LabRole"

  subnet_ids = [
    aws_subnet.OBL-public-subnet.id,
    aws_subnet.OBL-public-subnet-2.id
  ]

  capacity_type  = "ON_DEMAND"
  instance_types = ["t3.large"]

  scaling_config {
    desired_size = 1
    max_size     = 5
    min_size     = 0
  }

  update_config {
    max_unavailable = 1
  }

  labels = {
    role = "OBL"
  }
}







/*   depends_on = [
    aws_iam_role_policy_attachment.amazon-eks-worker-node-policy,
    aws_iam_role_policy_attachment.amazon-eks-cni-policy,
    aws_iam_role_policy_attachment.amazon-ec2-container-registry-read-only,
  ] */



# Allow external changes without Terraform plan difference

/*   lifecycle {
    ignore_changes = [scaling_config[0].desired_size]
  }
} */