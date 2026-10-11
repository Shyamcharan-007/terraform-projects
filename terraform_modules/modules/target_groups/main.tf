resource "aws_lb_target_group" "mytg" {
    name        = "mytg"
    protocol    = "HTTP"
    port        = 80 
    target_type = "instance"

    health_check {
        port     = "traffic-port"
        path     = "/"
        protocol = "HTTP"
    }
}

resource "aws_lb_target_group_attachment" "myattach_1" {
    target_group_arn = aws_lb_target_group.mytg.arn
    target_id        = var.instance1
    port             = 80
}
resource "aws_lb_target_group_attachment" "myattach_2" {
    target_group_arn    = aws_lb_target_group.mytg.arn
    target_id           = var.instance2
    port                = 80
}
