variable "profile" {
  default     = "default"
  description = "Perfil de usuario"
}

variable "aws_region" {
  #default     = "us-east-1"
  description = "Region aplicar"
}

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

variable "nombre_cluster" {
  type        = string
  description = "Nombre del Cluster"
}

variable "ami_id" {
  #default = ""
  description = "Identificacion de la AMI"
}

variable "Sg_id" {
  #default = ""
  description = "SecurityGroup"
}
variable "instance_type" {
  #default = ""
  description = "Tipo de Instancia"
}
variable "name_id" {
  #default = ""
  description = "Nombre de la Instancia"
}
variable "key_id" {
  #default = ""
  description = "Nombre de la Key"
}


#### Variable de AWS ####

variable "aws_access_key_id" {
  type        = string
  description = "AWS access key ID"
}

variable "aws_secret_access_key" {
  type        = string
  description = "AWS secret access key"
}

variable "aws_session_token" {
  type        = string
  description = "AWS session token"
}

#### Variables de entorno por lista ####


