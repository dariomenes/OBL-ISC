### Variables locales del modulo RED ###
variable "vpc_cidr" {
  #default = "172.16.0.0/16"
  description = "Direccion y mascara"
}

variable "public_subnet" {
  #default = "172.16.1.0/24"
  description = "Direccion de primer subred"
}

variable "public_subnet-2" {
  #default = "172.16.2.0/24"
  description = "Direccion segunda subred"
}

variable "vpc_aws_az" {
  #default = "us-east-1a"
  description = "Zona de Disponibilidad"
}

variable "vpc_aws_az-2" {
  #default = "us-east-1b"
  description = "Zona de Disponibilidad 2"
}

variable "name_vpc" {
  #default = "OBL-2023"
  description = "Nombre VPC"
}

variable "tag_subnet1" {
  type = string
  description = "Tag Subnet"
}

variable "tag_subnet2" {
  type = string
  description = "Tag Subnet2"
}

variable "tag_igw" {
  type = string
  description = "Tag IGW"
}

variable "tag_tablarutas" {
  type = string
  description = "Tabla de rutas"
}
