#######################################
#####      Modulos propios      #######
#######################################
module "red" {
  source = "./modules/red"

  vpc_cidr        = var.vpc_cidr             # Direccion de Red
  public_subnet   = var.public_subnet        # Subred y Mascara 1
  public_subnet-2 = var.public_subnet-2      # Subred y Mascara 2
  vpc_aws_az      = var.vpc_aws_az           # AZ 1
  vpc_aws_az-2    = var.vpc_aws_az-2         # AZ 2
  name_vpc        = var.name_vpc             # Nombre VPC
  tag_subnet1     = var.tag_subnet1          # Tag Subnet1
  tag_subnet2     = var.tag_subnet2          # Tag Subnet2
  tag_igw         = var.tag_igw              # Tag IGW
  tag_tablarutas  = var.tag_tablarutas       # Tag Default Route
}

module "infra" {
  source = "./modules/infra"

  identity_vpc      = module.red.aws_vpc_id  # Variable ID de la VPC
  id-subnet-1       = module.red.id-subnet-1 # Variable ID de la Subnet-1
  id-subnet-2       = module.red.id-subnet-2 # Variable ID de la Subnet-2
  nombre_cluster    = var.nombre_cluster     # Nombre del Cluster EKS
  tag_cluster       = var.tag_cluster        # Tag del Cluster
  nombre_clusterSG  = var.nombre_clusterSG   # Nombre del Cluster
  nombre_NodoSG     = var.nombre_NodoSG      # Nombre del SG del nodo
  tag_nodoSG        = var.tag_nodoSG         # Tag del SG del nodo
  tag_clusterSG     = var.tag_clusterSG      # Tag del SG del Nodo
  nombre_grupoNodos = var.nombre_grupoNodos  # Nombre del grupo de nodos
  ami_typeNodos     = var.ami_typeNodos      # AMI de los nodos
  capacidadNodo     = var.capacidadNodo      # Capacidad de los nodos
  instancia_deNodo  = var.instancia_deNodo    # Tipo de instancia a correr en Nodo
  
  depends_on = [module.red] # Condicion para ejecutarse previamente despues de RED
}