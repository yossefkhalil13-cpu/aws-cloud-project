#######################################################
# Application Load Balancer
#######################################################
resource "aws_lb" "app_alb" {
  name               = "app-alb"
  load_balancer_type = "application"
  internal           = false
  security_groups    = [aws_security_group.alb_sg.id]
  subnets            = module.vpc.public_subnets

  tags = {
    Name = "app-alb"
  }
}

#######################################################
# Target Group
#######################################################
resource "aws_lb_target_group" "app_tg" {
  name        = "app-tg"
  port        = 3000
  protocol    = "HTTP"
  target_type = "ip"
  vpc_id      = module.vpc.vpc_id

  # IMPORTANT: correct health check
  health_check {
    enabled             = true
    healthy_threshold   = 2
    unhealthy_threshold = 2
    interval            = 20
    timeout             = 5
    path                = "/health"
    protocol            = "HTTP"
  }
}

#######################################################
# Listener
#######################################################
resource "aws_lb_listener" "app_listener" {
  load_balancer_arn = aws_lb.app_alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.app_tg.arn
  }
}

