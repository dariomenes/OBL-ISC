##### Variables locales del modulo INFRA #####
variable "identity_vpc" {
  type = string
  description = "Para saber el Output ID de la VPC"
}
variable "id-subnet-1" {
  type = string
  description = "ID del Subnet 1"
}

variable "id-subnet-2" {
  type = string
  description = "ID del Subnet 2"
}

variable "nombre_cluster" {
  type= string
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
  type = string
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