#### No es Necesario el EC2 Kubernetes se encarga ####



/* resource "aws_instance" "OBL-instance" {
  ami                    = "ami-03ededff12e34e59e"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.OBL-sg.id]
  key_name               = "vockey"

  subnet_id = aws_subnet.OBL-public-subnet.id ##Agregar la Subred donde esta.

  tags = {
    Name      = "OBL-instance"
    terraform = "True"

  }
  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file("/home/dario/trabajos-practicos/AC2-Terraform/labsuser.pem")
    host        = self.public_ip
  }
  provisioner "remote-exec" {
    inline = [
      "sudo yum install -y httpd",
      "sudo yum install -y git curl",
      "git clone https://github.com/mauricioamendola/chaos-monkey-app.git",
      "sudo mv chaos-monkey-app/website/* /var/www/html/",
      "sudo systemctl enable httpd",
      "sudo systemctl start httpd",
    ]
  }
} */
