resource "aws_vpc" "myvpc" {
  cidr_block = var.cidr
}

resource "aws_subnet" "subnet1" {
  vpc_id                  = aws_vpc.myvpc.id
  cidr_block              = "10.1.0.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true
}

resource "aws_subnet" "subnet2" {
  vpc_id                  = aws_vpc.myvpc.id
  availability_zone       = "us-east-1b"
  cidr_block              = "10.1.1.0/24"
  map_public_ip_on_launch = true
}

resource "aws_security_group" "mysg" {
  name   = "web"
  vpc_id = aws_vpc.myvpc.id

  tags = {
    Name = "web_sg"
  }

  ingress {
    description = "HTTP for vpc"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "SSH"
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
}

resource "aws_internet_gateway" "myigw" {
  vpc_id = aws_vpc.myvpc.id
}

resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.myvpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.myigw.id
  }
}

resource "aws_route_table_association" "rta1" {
  subnet_id      = aws_subnet.subnet1.id
  route_table_id = aws_route_table.rt.id
}

resource "aws_route_table_association" "rta2" {
  subnet_id      = aws_subnet.subnet2.id
  route_table_id = aws_route_table.rt.id
}

resource "aws_s3_bucket" "mybuc" {
  bucket_prefix = "shyamterraformproject"
}

resource "aws_instance" "webserver1" {
  ami                    = "ami-0c101f26f147a7fd"
  instance_type          = "t3.micro"
  subnet_id              = aws_subnet.subnet1.id
  vpc_security_group_ids = [aws_security_group.mysg.id]

  tags = {
    Name = "webserver1"
  }
}

resource "aws_instance" "webserver2" {
  ami                    = "ami-0c101f26f147a7fd"
  instance_type          = "t3.micro"
  subnet_id              = aws_subnet.subnet2.id
  vpc_security_group_ids = [aws_security_group.mysg.id]

  tags = {
    Name = "webserver2"
  }
}

resource "aws_lb" "mylb" {
  name               = "mylb"
  security_groups    = [aws_security_group.mysg.id]
  subnets            = [aws_subnet.subnet1.id, aws_subnet.subnet2.id]
  load_balancer_type = "application"

  tags = {
    Name = "web"
  }
}

resource "aws_lb_target_group" "tg1" {
  name        = "mylb-tg"
  vpc_id      = aws_vpc.myvpc.id
  port        = 80
  protocol    = "HTTP"
  target_type = "instance"

  health_check {
    path     = "/"
    port     = "traffic_port"
    protocol = "HTTP"
  }
}

resource "aws_lb_target_group_attachment" "attach1" {
  target_group_arn = aws_lb_target_group.tg1.arn
  target_id        = aws_instance.webserver1.id
  port             = 80
}

resource "aws_lb_target_group_attachment" "attach2" {
  target_group_arn = aws_lb_target_group.tg1.arn
  target_id        = aws_instance.webserver2.id
  port             = 80
}

resource "aws_lb_listener" "listener" {
  protocol          = "HTTP"
  port              = 80
  load_balancer_arn = aws_lb.mylb.arn

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg1.arn
  }
}

output "loadbalancerdns" {
  value = aws_lb.mylb.dns_name
}
