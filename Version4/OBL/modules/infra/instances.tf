/*resource "aws_instance" "OBL-instance" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  key_name                    = var.key_id
  vpc_security_group_ids = [aws_security_group.OBL-sg.id]
  subnet_id = var.id-subnet-1

  tags = {
    Name      = var.name_id
    terraform = "True"

  }
  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file("./modules/infra/labsuser.pem")
    host        = self.public_ip
  }
  provisioner "file" {
    source      = "./modules/infra/script.sh"
    destination = "/home/ec2-user/script.sh"
  }
  provisioner "file" {
    source      = "./deployment/manifests.yaml"
    destination = "/home/ec2-user/manifests.yaml"
  }
  provisioner "remote-exec" {
    inline = [
      "export AWS_ACCESS_KEY_ID=${var.aws_access_key_id}",
      "export AWS_SECRET_ACCESS_KEY=${var.aws_secret_access_key}",
      "export AWS_DEFAULT_REGION=${var.aws_region}",
      "export AWS_SESSION_TOKEN=${var.aws_session_token}",
      "curl -LO https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl",
      "sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl",
      "chmod +x /home/ec2-user/script.sh",
    ]
  }
}*/
