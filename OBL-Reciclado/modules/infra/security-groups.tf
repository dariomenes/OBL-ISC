resource "aws_security_group" "OBL-sg" {
  name   = "BitBeat-OBL-sg"
  vpc_id = aws_vpc.vpc-OBL.id
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "BitBeat-OBL-sg"
  }
}

/* resource "aws_security_group" "OBL-lb-sg" {
  name   = "BitBeat-OBL-lb-sg"
  vpc_id = aws_vpc.vpc-OBL.id
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "BitBeat-OBL-lb-sg"
  }
} */