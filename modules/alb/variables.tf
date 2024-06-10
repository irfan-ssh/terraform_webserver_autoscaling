variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}

variable "name" {
  description = "The name of the environment"
  type        = string
}

variable "security_group_ids" {
  description = "List of security group IDs"
  type        = list(string)
}

variable "subnet_ids" {
  description = "List of subnet IDs"
  type        = list(string)
}
