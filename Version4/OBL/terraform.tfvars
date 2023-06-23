### Input para Modulo Red ###
vpc_cidr        = "172.16.0.0/16"
public_subnet   = "172.16.1.0/24"
public_subnet-2 = "172.16.2.0/24"
vpc_aws_az      = "us-east-1a"
vpc_aws_az-2    = "us-east-1b"
name_vpc        = "OBL-VPC"


### Input para Modulo INFRA ###

ami_id        = "ami-02396cdd13e9a1257" #ami-022e1a32d3f742bd8
Sg_id         = "SG-ID"
instance_type = "t2.micro"

name_id = "Bastion-OBL"
key_id  = "vockey"

nombre_cluster = "kluster"


#### Input de las variables para AWS ####

profile = "default"

/* remote_exec_commands = [

  "export AWS_ACCESS_KEY_ID=${var.aws_access_key_id}",
  "export AWS_SECRET_ACCESS_KEY=${var.aws_secret_access_key}",
  "export AWS_DEFAULT_REGION=${var.aws_region}",
  "export AWS_SESSION_TOKEN=${var.aws_session_token}",

  "chmod +x /home/ec2-user/script.sh",

  "sh script.sh",
  ] */



aws_access_key_id = "ASIAZOVHJFMTCZLNJ5VO"

aws_secret_access_key = "+YYx5nhU/hG1kdTs2FDIg03HVxJj7Hnwq7nMi36c"

aws_region = "us-east-1"

aws_session_token = "FwoGZXIvYXdzEDEaDAmjY0VEkt5T3mE/aSK2AcjXT0tgLT1T0t0C2XK8aMee8z4MrQxIOlmFwqxHJJdn3MeWHUoJCIKw3q6GwsEfdqypkYa6Fqp+x1FDvhnGhDYCBxaIK7u+cp4pED84Nqjp5o49+VSTV+lSCOK78K5mveN7Y/qdru6d2HD1BnZfRJO93K+UROgsIUN82NOwClFqYCGsCpKj7zPauxRDKvPjw8twopnP0A8hqfrdn6F2F6Nj9y5AEDZTJiDBGKZS9noE7Gd/7C6MKLvEvKQGMi3cRXzihPos0oiSPVEe0ZiXyAt85NmsO0TWIa9WyfaIDAbR1cApH2jyEWSHb+0="