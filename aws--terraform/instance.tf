provider "aws" {
    region="us-east-1"
}
resource "aws_instance" "sample" {
    ami = "ami-0c101f26f147a7fd"
    instance_type = "t3.micro"
    tags = {
        Name = "sample"
    }
}