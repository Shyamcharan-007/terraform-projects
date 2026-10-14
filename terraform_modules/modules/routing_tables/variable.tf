variable "vpc" {
  type        = string
  description = "vpc id for creating routing table"

}
variable "igw_id" {
  type        = string
  description = "internet gateway id for creating routing table"
}

variable "subnet_1" {
  type        = string
  description = "id of subnet 1"
}

variable "subnet_2" {
  type        = string
  description = "id of subnet 2"
}
