# Resume Modulo Red
## Requirements

No requirements.

## Resources

| Name | Type |
|------|------|
| [aws_default_route_table.OBL-route-table](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/default_route_table) | resource |
| [aws_internet_gateway.OBL-IGW](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway) | resource |
| [aws_subnet.OBL-public-subnet](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.OBL-public-subnet-2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_vpc.vpc-OBL](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name_vpc"></a> [name\_vpc](#input\_name\_vpc) | Nombre VPC | `any` | n/a | yes |
| <a name="input_public_subnet"></a> [public\_subnet](#input\_public\_subnet) | Direccion de primer subred | `any` | n/a | yes |
| <a name="input_public_subnet-2"></a> [public\_subnet-2](#input\_public\_subnet-2) | Direccion segunda subred | `any` | n/a | yes |
| <a name="input_tag_igw"></a> [tag\_igw](#input\_tag\_igw) | Tag IGW | `string` | n/a | yes |
| <a name="input_tag_subnet1"></a> [tag\_subnet1](#input\_tag\_subnet1) | Tag Subnet | `string` | n/a | yes |
| <a name="input_tag_subnet2"></a> [tag\_subnet2](#input\_tag\_subnet2) | Tag Subnet2 | `string` | n/a | yes |
| <a name="input_tag_tablarutas"></a> [tag\_tablarutas](#input\_tag\_tablarutas) | Tabla de rutas | `string` | n/a | yes |
| <a name="input_vpc_aws_az"></a> [vpc\_aws\_az](#input\_vpc\_aws\_az) | Zona de Disponibilidad | `any` | n/a | yes |
| <a name="input_vpc_aws_az-2"></a> [vpc\_aws\_az-2](#input\_vpc\_aws\_az-2) | Zona de Disponibilidad 2 | `any` | n/a | yes |
| <a name="input_vpc_cidr"></a> [vpc\_cidr](#input\_vpc\_cidr) | Direccion y mascara | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_aws_vpc_id"></a> [aws\_vpc\_id](#output\_aws\_vpc\_id) | n/a |
| <a name="output_id-subnet-1"></a> [id-subnet-1](#output\_id-subnet-1) | n/a |
| <a name="output_id-subnet-2"></a> [id-subnet-2](#output\_id-subnet-2) | n/a |

## Explicación del código
* main.tf
```javascript
#### Recursos de Red #### 
resource "aws_vpc" "vpc-OBL" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = var.name_vpc
  }
}
resource "aws_subnet" "OBL-public-subnet" {
  vpc_id                  = aws_vpc.vpc-OBL.id
  cidr_block              = var.public_subnet
  availability_zone       = var.vpc_aws_az
  map_public_ip_on_launch = "true"
  
  tags = {
    Name = var.tag_subnet1
  }
}
resource "aws_subnet" "OBL-public-subnet-2" {
  vpc_id                  = aws_vpc.vpc-OBL.id
  cidr_block              = var.public_subnet-2
  availability_zone       = var.vpc_aws_az-2
  map_public_ip_on_launch = "true"
  
  tags = {
    Name = var.tag_subnet2
  }
}
resource "aws_internet_gateway" "OBL-IGW" {
  vpc_id = aws_vpc.vpc-OBL.id
  tags = {
    Name = var.tag_igw
  }
}
resource "aws_default_route_table" "OBL-route-table" {
  default_route_table_id = aws_vpc.vpc-OBL.default_route_table_id
  
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.OBL-IGW.id
  }
  tags = {
    Name = var.tag_tablarutas
  }
}
```
* output.tf
```javascript
output "aws_vpc_id" {
  value = aws_vpc.vpc-OBL.id
}

output "id-subnet-1" {
  value = aws_subnet.OBL-public-subnet.id
}

output "id-subnet-2" {
  value = aws_subnet.OBL-public-subnet-2.id
}
```
* variables.tf
```javascript
### Variables locales del modulo RED ###
```
***
#### Anexo - recursos externos

<https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eks_cluster>

<https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eks_node_group>

[Ir al índice](/Version5/OBL/README.md)