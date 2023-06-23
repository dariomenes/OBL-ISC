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