# Resumen Backend
## Providers
| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| [profile](var.profile) | var.profile | `string` | n/a | yes
| [region](var.region) | var.region | `string` | n/a | yes

## Resources

| Name | Type |
|------|------|
| [aws_dynamodb_table.backenddynamodb](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/dynamodb_table) | resource |
| [aws_s3_bucket.recursobucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_nombrebucket"></a> [nombrebucket](#input\_nombrebucket) | NombreDelBucket | `string` | n/a | yes |
| <a name="input_nombredynamodb"></a> [nombredynamodb](#input\_nombredynamodb) | NombreDynamoDB | `string` | n/a | yes |
| <a name="input_profile"></a> [profile](#input\_profile) | Variable del perfil | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | Variable de region | `string` | n/a | yes |

## Explicación del código
* main.tf
```javascript
## Crear Bucket ##
resource "aws_s3_bucket" "recursobucket" {
  bucket        = var.nombrebucket
  force_destroy = true
  tags = {
    Name = "MiBucket"
  }
}
## DynamoDb para datos ##
resource "aws_dynamodb_table" "backenddynamodb" {
  name           = var.nombredynamodb
  hash_key       = "LockID"
  read_capacity  = 20
  write_capacity = 20
  attribute {
    name = "LockID"
    type = "S"
  }
}

1 - Comentar modulo backend antes hacer terraform init ya que los recursos no estan creados
2 - Quitar comentario de la linea 53 a la 61, despues de tener los recursos se copia el State al bucket
3 - Ejecutar terraform init -lock=false

terraform {
  backend "s3" {
    bucket         = "stateseguro" 4 - Mismo str que que tfvars
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-lock-table"
    encrypt        = false
  }
}
```
* terraform.tfvars
```javascript
profile        = "default"
region         = "us-east-1"
nombrebucket   = "stateseguro"
nombredynamodb = "dynamodb"
```
* variables.tf
```javascript
//Variable perfil para el Backend//
variable "profile" {
  type = string
  #default     = "default"
  description = "Variable del perfil"
}

variable "nombrebucket" {
  type = string
  #default = "Nombre Del Bucket"
  description = "NombreDelBucket"
}

variable "nombredynamodb" {
  type = string
  #default = nombredynamodb
  description = "NombreDynamoDB"
}
```
***
#### Anexo - recursos externos

<https://angelo-malatacca83.medium.com/aws-terraform-s3-and-dynamodb-backend-3b28431a76c1>

<https://registry.terraform.io/providers/hashicorp/aws/5.4.0/docs/resources/s3_bucket>

