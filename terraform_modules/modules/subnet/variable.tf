variable "subnet_1" {
  description = "subnet id for ec2 instnace 1"
  type        = string
}

variable "subnet_2" {
  description = "subnet id for ec2 instnace 2"
  type        = string
}

variable "availability_zone_1" {
  default = "us-east-1a"
  type    = string
}


variable "availability_zone_2" {
  default = "us-east-1b"
  type    = string

}

variable "map_public_ip_launch" {
  default = true
  type    = bool

}

variable "vpc" {
  type        = string
  description = "vpc id to creating subnets"
}
