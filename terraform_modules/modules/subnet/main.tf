resource "aws_subnet" "sub1" {
  vpc_id                  = var.vpc
  cidr_block              = var.cidr_block_1
  availability_zone       = var.availability_zone_1
  map_public_ip_on_launch = var.map_public_ip_launch

  tags = {
    Name = "sub1"
  }
}

resource "aws_subnet" "sub2" {
  vpc_id                  = var.vpc
  cidr_block              = var.cidr_block_2
  availability_zone       = var.availability_zone_2
  map_public_ip_on_launch = var.map_public_ip_launch

  tags = {
    Name = "sub2"
  }
}

