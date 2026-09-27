resource "aws_vpc" "myvpc" {
  cidr_block = var.cidr
}

resource "aws_subnet" "mysubnet1" {
  vpc_id            = aws_vpc.myvpc.id
  cidr_block        = "10.1.0.0/24"
  availability_zone = "us-east-1a"
}

resource "aws_subnet" "mysubnet2" {
  vpc_id            = aws_vpc.myvpc.id
  cidr_block        = "10.1.1.0/24"
  availability_zone = "us-east-1b"
}

resource "aws_internet_gateway" "myigw" {
  vpc_id = aws_vpc.myvpc.id
}

resource "aws_route_table" "myrt" {
  vpc_id = aws_vpc.myvpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.myigw.id
  }
}
resource "aws_route_table_association" "myrta1" {
  subnet_id      = aws_subnet.mysubnet1.id
  route_table_id = aws_route_table.myrt.id
}
resource "aws_route_table_association" "myrta2" {
  subnet_id      = aws_subnet.mysubnet2.id
  route_table_id = aws_route_table.myrt.id
}
resource "aws_security_group" "mysg" {
  name        = "mysg"
  description = "Allow SSH and HTTP traffic"
  vpc_id      = aws_vpc.myvpc.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "mysg"
  }
}

resource "aws_s3_bucket" "mybuc" {
  bucket = "shyam_terraform_project"
}

resource "aws_instance" "myins1" {
  instance_type          = "t3.micro"
  ami                    = "ami-0c02fb55956c7d316"
  subnet_id              = aws_subnet.mysubnet1.id
  vpc_security_group_ids = [aws_security_group.mysg.id]
}
resource "aws_instance" "myins2" {
  instance_type          = "t3.micro"
  ami                    = "ami-0c02fb55956c7d316"
  subnet_id              = aws_subnet.mysubnet2.id
  vpc_security_group_ids = [aws_security_group.mysg.id]
}

resource "aws_lb" "mylb" {
  name               = "mylb"
  security_groups    = [aws_security_group.mysg.id]
  load_balancer_type = "application"
  subnets            = [aws_subnet.mysubnet1.id, aws_subnet.mysubnet2.id]

}
resource "aws_lb_target_group" "tg" {
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.myvpc.id

  health_check {
    path     = "/"
    protocol = "HTTP"
  }
}
resource "aws_lb_target_group_attachment" "attach1" {
  target_group_arn = aws_lb_target_group.tg.arn
  target_id        = aws_instance.myins1.id
}
resource "aws_lb_target_groups_attachment" "attach2" {
  target_groups_arn = aws_lb_target_group.tg.arn
  target_id         = aws_instance.myins2.id
}
resource "aws_lb_listener" "mylistener" {
  load_balancer_arn = aws_lb.mylb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg.arn
  }

}
output "loadbalancerdns" {
  value = aws_lb.mylb.dns_name
}












