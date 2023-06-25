//Variable región para el Backend//
variable "region" {
  type = string
  #default     = "us-east-1"
  description = "Variable de region"
}

//Variable perfil para el Backend//
variable "profile" {
  type = string
  #default     = "default"
  description = "Variable del perfil"
}

variable "nombrebucket" {
  type = string
  #default = "NOmbre Del Bucket"
  description = "NombreDelBucket"
}

variable "nombredynamodb" {
  type = string
  #default = nombredynamodb
  description = "NombreDynamoDB"
}
