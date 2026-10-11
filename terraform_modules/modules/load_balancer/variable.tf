variable "alb_sg_id" {
  type        = string
  description = "security group id for alb"
}

variable "subnet_1" {
  type        = string
  description = "subnet 1 id for alb"
}
variable "subnet_2" {
  type        = string
  description = "subnet 2 id for alb"
}
variable "target_group_arn" {
  type        = string
  description = "target group arn for alb"
}