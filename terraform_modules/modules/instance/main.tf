resource "aws_instance" "ins1" {
  instance_type = var.instance_type
  ami           = var.ami
  subnet_id     = var.subnet_1
  vpc_security_group_ids = [var.security_group_id]

  user_data = <<-EOF
    #!/bin/bash
    dnf install -y httpd
    systemctl enable --now httpd
    echo "<h1>Welcome to shyam server 1</h1>" > /var/www/html/index.html
  EOF

  tags = {
    name = "server1"
  }
}

resource "aws_instance" "ins2" {
  instance_type = var.instance_type
  ami           = var.ami
  subnet_id     = var.subnet_2
  vpc_security_group_ids = [var.security_group_id]

  user_data = <<-EOF
    #!/bin/bash
    dnf install -y httpd
    systemctl enable --now httpd
    echo "<h1>Welcome to shyam server 2</h1>" > /var/www/html/index.html
  EOF

  tags = {
    name = "server2"
  }
}