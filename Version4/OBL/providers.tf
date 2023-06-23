provider "aws" {
  profile = var.profile
  region  = var.aws_region
}

#### Se Agrega el Provider de KubeCTL para controlar el Cluster creado ###
terraform {
  required_providers {
    kubectl = {
      source  = "ddzero2c/kubectl"
      version = "1.10.4"
    }
    docker = {
      source  = "kreuzwerker/docker"
      version = "3.0.2"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.21.1"
    }
  }
}
