#### No es Necesario el LB ####


/* resource "aws_lb_target_group" "OBL-tg" {
  name        = "OBL-tg"
  port        = 80
  target_type = "instance"
  protocol    = "HTTP"
  vpc_id      = aws_vpc.vpc-OBL.id
}

resource "aws_alb_target_group_attachment" "OBL-tg-attachment" {
  target_group_arn = aws_lb_target_group.OBL-tg.arn
  target_id        = aws_instance.OBL-instance.id
  port             = 80
}

resource "aws_lb" "OBL-lb" {
  name               = "OBL-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.OBL-lb-sg.id]
  subnets            = [aws_subnet.OBL-public-subnet, aws_subnet.OBL-public-subnet-2.id]

  enable_deletion_protection = false

  tags = {
    Environment = "production"
  }
}

resource "aws_lb_listener" "OBL-listener" {
  load_balancer_arn = aws_lb.OBL-lb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.OBL-tg.arn
  }
}


resource "aws_lb_listener_rule" "OBL-listener-rule" {
  listener_arn = aws_lb_listener.OBL-listener.arn
  priority     = 100

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.OBL-tg.arn

  }

  condition {
    path_pattern {
      values = ["/var/www/html/index.html"]
    }
  }
}
 */