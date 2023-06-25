## Requirements

| Name | Version |
|------|---------|
| <a name="AWS"></a> [AWS]() | last |

## Providers

AWS Provider

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_infra"></a> [infra](#module\_infra) | ./modules/infra | n/a |
| <a name="module_red"></a> [red](#module\_red) | ./modules/red | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ami_typeNodos"></a> [ami\_typeNodos](#input\_ami\_typeNodos) | Tipo de AMI para el Nodo | `string` | n/a | yes |
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | Region aplicar | `string` | `"us-east-1"` | no |
| <a name="input_capacidadNodo"></a> [capacidadNodo](#input\_capacidadNodo) | Capacidad de los nodos | `string` | n/a | yes |
| <a name="input_instancia_deNodo"></a> [instancia\_deNodo](#input\_instancia\_deNodo) | Tipo de instancia para el Nodo | `string` | n/a | yes |
| <a name="input_name_vpc"></a> [name\_vpc](#input\_name\_vpc) | Nombre VPC | `any` | n/a | yes |
| <a name="input_nombre_NodoSG"></a> [nombre\_NodoSG](#input\_nombre\_NodoSG) | Nombre del SG para el Nodo | `string` | n/a | yes |
| <a name="input_nombre_cluster"></a> [nombre\_cluster](#input\_nombre\_cluster) | Nombre de EKS | `string` | n/a | yes |
| <a name="input_nombre_clusterSG"></a> [nombre\_clusterSG](#input\_nombre\_clusterSG) | Nombre del Cluster | `string` | n/a | yes |
| <a name="input_nombre_grupoNodos"></a> [nombre\_grupoNodos](#input\_nombre\_grupoNodos) | Nombre del grupo de nodos | `string` | n/a | yes |
| <a name="input_profile"></a> [profile](#input\_profile) | Perfil de usuario | `string` | `"default"` | no |
| <a name="input_public_subnet"></a> [public\_subnet](#input\_public\_subnet) | Direccion de primer subred | `any` | n/a | yes |
| <a name="input_public_subnet-2"></a> [public\_subnet-2](#input\_public\_subnet-2) | Direccion de segunda subred | `any` | n/a | yes |
| <a name="input_tag_cluster"></a> [tag\_cluster](#input\_tag\_cluster) | Nombre del Cluster | `string` | n/a | yes |
| <a name="input_tag_clusterSG"></a> [tag\_clusterSG](#input\_tag\_clusterSG) | Nombre del Cluster | `string` | n/a | yes |
| <a name="input_tag_igw"></a> [tag\_igw](#input\_tag\_igw) | Tag IGW | `string` | n/a | yes |
| <a name="input_tag_nodoSG"></a> [tag\_nodoSG](#input\_tag\_nodoSG) | Nombre del Cluster | `string` | n/a | yes |
| <a name="input_tag_subnet1"></a> [tag\_subnet1](#input\_tag\_subnet1) | Tag Subnet | `string` | n/a | yes |
| <a name="input_tag_subnet2"></a> [tag\_subnet2](#input\_tag\_subnet2) | Tag Subnet2 | `string` | n/a | yes |
| <a name="input_tag_tablarutas"></a> [tag\_tablarutas](#input\_tag\_tablarutas) | Tabla de rutas | `string` | n/a | yes |
| <a name="input_vpc_aws_az"></a> [vpc\_aws\_az](#input\_vpc\_aws\_az) | Zona de disponibilidad de aplicacion 1 | `any` | n/a | yes |
| <a name="input_vpc_aws_az-2"></a> [vpc\_aws\_az-2](#input\_vpc\_aws\_az-2) | Zona de disponibilidad de aplicacion 2 | `any` | n/a | yes |
| <a name="input_vpc_cidr"></a> [vpc\_cidr](#input\_vpc\_cidr) | CIDR de la VPC | `any` | n/a | yes |

## Explicación del código
* main.tf
```javascript
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
```
* providers.tf
```javascript
provider "aws" {
  profile = var.profile
  region  = var.aws_region
}
```
* terraform.tfvars
```javascript
#############################
### Input para Modulo RED ###
#############################

vpc_cidr        = "10.0.0.0/16"
public_subnet   = "10.0.1.0/24"
public_subnet-2 = "10.0.2.0/24"
vpc_aws_az      = "us-east-1a"
vpc_aws_az-2    = "us-east-1b"
name_vpc        = "OBL-VPC"
tag_subnet1     = "Subred-1"
tag_subnet2     = "Subred-2"
tag_igw         = "IGW"
tag_tablarutas  = "TablaDeRutas"

###############################
### Input para Modulo INFRA ###
###############################

nombre_cluster    = "kluster"
tag_cluster       = "OBL-Cluster"
nombre_clusterSG  = "OBL-SG-Cluster"
nombre_NodoSG     = "OBL-SG-Nodo-Cluster"
tag_nodoSG        = "Kluster"
tag_clusterSG     = "SG-Cluster"
nombre_grupoNodos = "OBL-Nodos"
ami_typeNodos     = "BOTTLEROCKET_x86_64"
capacidadNodo     = "ON_DEMAND"
instancia_deNodo  = "t3.medium"
```
* variables.tf
```javascript
### Variables globales ###
```
***
[Ir al índice](OBL-ISC/README.md)