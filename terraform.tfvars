#############################
### Input para Modulo Red ###
#############################

vpc_cidr        = "10.0.0.0/16"
public_subnet   = "10.0.1.0/24"
public_subnet-2 = "10.0.2.0/24"
vpc_aws_az      = "us-east-1a"
vpc_aws_az-2    = "us-east-1b"
name_vpc        = "OBL-VPC"
tag_subnet1     = "Subred-1"
tag_subnet2     = "Subred-2"
tag_igw         = "IGW"
tag_tablarutas  = "TablaDeRutas"

###############################
### Input para Modulo INFRA ###
###############################

nombre_cluster    = "kluster"
tag_cluster       = "OBL-Cluster"
nombre_clusterSG  = "OBL-SG-Cluster"
nombre_NodoSG     = "OBL-SG-Nodo-Cluster"
tag_nodoSG        = "Kluster"
tag_clusterSG     = "SG-Cluster"
nombre_grupoNodos = "OBL-Nodos"
ami_typeNodos     = "BOTTLEROCKET_x86_64"
capacidadNodo     = "ON_DEMAND"
instancia_deNodo  = "t3.medium"