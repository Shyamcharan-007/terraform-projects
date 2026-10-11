variable "instance_type" {
  default = "t3.micro"
}

variable "ami" {
  default = "ami-1039298083873"
}

variable "vpc_id" {
  default = "10.1.0.0/16"
}

variable "subnet_1" {
  default     = "10.1.0.0/24"
  description = "cidr_block for subnet 1"

}

variable "subnet_2" {
  default     = "10.1.1.0/24"
  description = "cidr_block for subnet 2"
}

variable "security_group_id" {
  type        = string
  description = "security group id for EC2 instances"
}
