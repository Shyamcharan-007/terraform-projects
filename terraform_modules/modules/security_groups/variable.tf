variable "vpc" {
  type        = string
  description = "vpc id for attaching the security group"
}

variable "ssh_cidr" {
  type        = string
  description = "public ip address in cidr notations"
}