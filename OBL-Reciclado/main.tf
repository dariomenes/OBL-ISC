##### Llamo a los modulos creados #####


module "infra" {
  source = "./modules/infra"

  vpc_cidr        = var.vpc_cidr_input
  public_subnet   = var.public_subnet_input
  vpc_aws_az      = var.vpc_aws_az_input
  public_subnet-2 = var.public_subnet-2_input
  vpc_aws_az-2    = var.vpc_aws_az-2_input


}





####### Salidas para verificar servicio#######



/* output "vpc_id" {
  value = module.infra.vpc.id
} */

#output "ec2-dns" {
#  value = aws_instance.OBL-instance.public_dns
#}

#output "ec2-public-ip" {
#  value = aws_instance.OBL-instance.public_ip
#}

#output "lb-ip" {
#  value = aws_lb.OBL-lb.dns_name
#}
