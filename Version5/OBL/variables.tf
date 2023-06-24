### Variables globales ###
variable "profile" {
  default     = "default"
  description = "Perfil de usuario"
}

variable "aws_region" {
  default     = "us-east-1"
  description = "Region aplicar"
}

### Variables de Red ####
variable "vpc_cidr" {
  #default     = "172.16.0.0/16"
  description = "CIDR de la VPC"
}

variable "public_subnet" {
  #default     = "172.16.1.0/24"
  description = "Direccion de primer subred"
}

variable "public_subnet-2" {
  #default     = "172.16.2.0/24"
  description = "Direccion de segunda subred"
}

variable "vpc_aws_az" {
  #default     = "us-east-1a"
  description = "Zona de disponibilidad de aplicacion 1"
}

variable "vpc_aws_az-2" {
  #default     = "us-east-1b"
  description = "Zona de disponibilidad de aplicacion 2"
}

variable "name_vpc" {
  #default = "OBL-2023"
  description = "Nombre VPC"
}

variable "tag_subnet1" {
  type        = string
  description = "Tag Subnet"
}

variable "tag_subnet2" {
  type        = string
  description = "Tag Subnet2"
}

variable "tag_igw" {
  type        = string
  description = "Tag IGW"
}

variable "tag_tablarutas" {
  type        = string
  description = "Tabla de rutas"
}

####Variables EKS ####

variable "nombre_cluster" {
  type        = string
  description = "Nombre de EKS"
}

variable "tag_cluster" {
  type        = string
  description = "Nombre del Cluster"
}

variable "nombre_clusterSG" {
  type        = string
  description = "Nombre del Cluster"
}

variable "nombre_NodoSG" {
  type        = string
  description = "Nombre del SG para el Nodo"
}
variable "tag_nodoSG" {
  type        = string
  description = "Nombre del Cluster"
}

variable "tag_clusterSG" {
  type        = string
  description = "Nombre del Cluster"
}

variable "nombre_grupoNodos" {
  type        = string
  description = "Nombre del grupo de nodos"
}

variable "ami_typeNodos" {
  type = string
  #default = "BOTTLEROCKET_x86_64"
  description = "Tipo de AMI para el Nodo"
}

variable "capacidadNodo" {
  type = string
  #default= "ON_DEMAND"
  description = "Capacidad de los nodos"
}

variable "instancia_deNodo" {
  type = string
  #default = t3.medium
  description = "Tipo de instancia para el Nodo"
}