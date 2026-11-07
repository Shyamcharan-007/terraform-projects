variable "cidr" {
  default     = "10.1.0.0/16"
  description = "CIDR block for the VPC"
  type        = string
}
variable "instance_type" {
  default     = "t3.micro"
  description = "Instance type for the EC2 instances"
}
variable "aws_region" {
  default     = "us-east-1"
  type        = string
  description = "AWS region to deploy resources"
}

variable "ami_id" {
  default     = "ami-097855b862d5b1eb2"
  type        = string
  description = "AMI ID for the aws instances"

}
variable "ssh_cidr" {
  type        = string
  description = "public ip address followed by /32"
}
variable "subnet_1" {
  default = "10.1.0.0/24"
  type = string
}

variable "subnet_2" {
  default = "10.1.1.0/24"
  type = string
}
