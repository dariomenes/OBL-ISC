variable "profile" {
  default = "default"
}

variable "region" {
  default = "us-east-1"
}

#variable "regiones" {
#  type    = list(string)
#  default = ["us-east-1", "us-east-2"]
#}


variable "vpc_cidr" {
  default = "172.16.0.0/16"
}

variable "public_subnet" {
  default = "172.16.1.0/24"
}

variable "public_subnet-2" {
  default = "172.16.2.0/24"
}

variable "vpc_aws_az" {
  default = "us-east-1a"
}

variable "vpc_aws_az-2" {
  default = "us-east-1b"
}

####  Variables de Input al Modulo, asignarles valores en terraform.tfvars #####
variable "vpc_cidr_input" {
  type = string
}
variable "public_subnet_input" {
  type = string
}

variable "vpc_aws_az_input" {
  type = string
}

variable "public_subnet-2_input" {
  type = string
}

variable "vpc_aws_az-2_input" {
  type = string
}