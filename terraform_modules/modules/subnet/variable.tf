variable "cidr_block_1" {
  default     = "10.1.0.0/24"
  description = "cidr_block for subnet 1"
  type        = string
}

variable "cidr_block_2" {
  default     = "10.1.2.0/24"
  description = "cidr_block for subnet 2"
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
  type = bool

}

variable "vpc" {
  type        = string
  description = "vpc id to creating subnets"
}