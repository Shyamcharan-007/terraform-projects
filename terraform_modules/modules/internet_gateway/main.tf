resource "aws_internet_gateway" "myig" {
  vpc_id = var.vpc_id

  tags = {
    Name = "myig"
  }

}