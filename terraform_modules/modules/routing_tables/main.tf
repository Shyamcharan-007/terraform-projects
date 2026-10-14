resource "aws_route_table" "myrt" {
  vpc_id = var.vpc

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.igw_id
  }
  tags = {
    name = "myrt"
  }
}

resource "aws_route_table_association" "myrta1" {
  subnet_id      = var.subnet_1
  route_table_id = aws_route_table.myrt.id
}

resource "aws_route_table_association" "myrta2" {
  subnet_id      = var.subnet_2
  route_table_id = aws_route_table.myrt.id
}
