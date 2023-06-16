  resource "aws_vpc" "vpc-OBL" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "BitBeat-vpc-OBL"
    #"kubernetes.io/cluster/Kluster" = "shared"
  }
}

resource "aws_subnet" "OBL-public-subnet" {
  vpc_id                  = aws_vpc.vpc-OBL.id
  cidr_block              = var.public_subnet
  availability_zone       = var.vpc_aws_az
  map_public_ip_on_launch = "true"
  
  tags = {
    Name = "BitBeat-OBL-public-subnet"
    #"kubernetes.io/cluster/Kluster" = "shared"
    #"kubernetes.io/role/elb" = "1"
    
  }
}

resource "aws_subnet" "OBL-public-subnet-2" {
  vpc_id                  = aws_vpc.vpc-OBL.id
  cidr_block              = var.public_subnet-2
  availability_zone       = var.vpc_aws_az-2
  map_public_ip_on_launch = "true"
  
  tags = {
    Name = "BitBeat-OBL-public-subnet-2"
    #"kubernetes.io/cluster/Kluster" = "shared"
    #"kubernetes.io/role/elb" = "1"
  }
}
resource "aws_internet_gateway" "OBL-IGW" {
  vpc_id = aws_vpc.vpc-OBL.id
  tags = {
    Name = "BitBeat-OBL-gw"
  }
}

resource "aws_default_route_table" "OBL-route-table" {
  default_route_table_id = aws_vpc.vpc-OBL.default_route_table_id
  
  route {
    cidr_block = "0.0.0.0/0" 
    gateway_id = aws_internet_gateway.OBL-IGW.id
  }
  tags = {
    Name = "OBL-Default-route"
  }
}


##### Subnet Association Explicit ###
/* resource "aws_route_table_association" "publica" {
  subnet_id      = aws_subnet.OBL-public-subnet.id
  route_table_id = aws_vpc.vpc-OBL.default_route_table_id
}

resource "aws_route_table_association" "publica1" {
  subnet_id      = aws_subnet.OBL-public-subnet-2.id
  route_table_id = aws_vpc.vpc-OBL.default_route_table_id
} */