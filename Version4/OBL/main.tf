##### Llamo a los modulos creados #####
module "red" {
  source = "./modules/red"

  vpc_cidr        = var.vpc_cidr        # Direccion de Red
  public_subnet   = var.public_subnet   # Subred y Mascara 1
  public_subnet-2 = var.public_subnet-2 # Subred y Mascara 2
  vpc_aws_az      = var.vpc_aws_az      # AZ 1
  vpc_aws_az-2    = var.vpc_aws_az-2    # AZ 2
  name_vpc        = var.name_vpc        # Nombre VPC

}

module "infra" {
  source = "./modules/infra"

  identity_vpc   = module.red.aws_vpc_id  # Variable ID de la VPC
  id-subnet-1    = module.red.id-subnet-1 # Variable ID de la Subnet-1
  id-subnet-2    = module.red.id-subnet-2 # Variable ID de la Subnet-2
  ami_id         = var.ami_id             # Version de la AMI
  Sg_id          = var.Sg_id              # Identificacion del SG
  instance_type  = var.instance_type      # Tipo de Instancia
  nombre_cluster = var.nombre_cluster     # Nombre del Cluster EKS

  name_id    = var.name_id  # Nombre de la Instancia
  key_id     = var.key_id   # Nombre de la Key
  depends_on = [module.red] # Condicion para ejecutarse previamente despues de RED


  ### Variables AWS ###

  aws_access_key_id     = var.aws_access_key_id
  aws_secret_access_key = var.aws_secret_access_key
  aws_region            = var.aws_region
  aws_session_token     = var.aws_session_token


}


####### Salidas para verificar servicio por modulo INFRA #######


#IP publica instancia
/* output "instance_public_ip" {
  value = module.infra.ec2-public-ip
} */


#Cluster Checkpoint
output "Checkpoint_EKS" {
  value = module.infra.eks_cluster
}

#Cluster End Point
#output "cluster_endpoint" {
  #value = module.infra.output_eks_cluster_endpoint
#}

#Cluster Certificate
output "output_eks_cluster_certificate" {
  value = module.infra
}


####### Salidas para verificar servicio por modulo RED #######

