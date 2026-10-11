variable "cidr" {
  default     = "10.0.0.0/16"
  description = "CIDR block for the VPC"
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
  default     = "ami-1039298083873"
  type        = string
  description = "AMI ID for aws instances"
}
variable "ssh_cidr" {
  type        = string
  description = "public ip address followed by /32"
}