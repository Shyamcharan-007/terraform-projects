variable "instance_type" {
  default = "t3.micro"
  type    = string
}

variable "ami" {
  default = "ami-097855b862d5b1eb2"
  type    = string
}

variable "subnet_1" {
  description = "subnet id for instance 1"
  type        = string
}

variable "subnet_2" {
  description = "subnet id for instance 2"
  type        = string
}

variable "security_group_id" {
  type        = string
  description = "security group id for EC2 instances"
}


