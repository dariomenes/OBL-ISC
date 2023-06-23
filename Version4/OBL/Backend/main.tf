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

## Comentar BackEnd antes hacer terraform init ya que los recursos no estan creados ##
## Quitar comentario Despues de creado se copia el State al bucket ###
## Despues de ejecutar el comando terraform init -lock=false ###
terraform {
  backend "s3" {
    bucket         = "stateseguro"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-lock-table"
    encrypt        = false
  }
}