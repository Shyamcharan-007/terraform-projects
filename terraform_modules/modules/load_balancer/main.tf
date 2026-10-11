resource "aws_lb" "mylb" {
  name               = "myalb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.alb_sg_id]
  subnets            = [var.subnet_1, var.subnet_2]

  tags = {
    Name = "myalb"
  }
}
resource "aws_lb_listener" "listener" {
  load_balancer_arn = aws_lb.mylb.arn
  protocol          = "HTTP"
  port              = 80

  default_action {
    type             = "forward"
    target_group_arn = var.target_group_arn
  }
}