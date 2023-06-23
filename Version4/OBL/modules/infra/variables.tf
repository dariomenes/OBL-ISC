variable "ami_id" {
  type        = string
  description = "Identificacion de AMI"
  #default = "ami-02396cdd13e9a1257"
}

variable "Sg_id" {
  type        = string
  description = "Nombre del grupo de Seguridad"
  
}
variable "instance_type" {
  type        = string
  description = "Tipo de Instancia"
  #default     = "t2.micro"
}

variable "key_id" {
  type        = string
  description = "Llave SSH"
}

variable "name_id" {
  type        = string
  description = "Nombre de la Instancia"
}

variable "nombre_cluster" {
  type = string
  description = "Nombre del Cluster"
}

##### Variables de salida del modulo RED #####
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


##### Variables de AWS #####

variable "aws_access_key_id" {
  type        = string
  description = "AWS access key ID"
}

variable "aws_secret_access_key" {
  type        = string
  description = "AWS secret access key"
}

variable "aws_region" {
  type        = string
  description = "AWS region"
}

variable "aws_session_token" {
  type        = string
  description = "AWS session token"
}