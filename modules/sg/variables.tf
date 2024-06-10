variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}

variable "name" {
  description = "The name of the environment"
  type        = string
}

variable "web_subnet_cidrs" {
  description = "List of web subnet CIDR blocks"
  type        = list(string)
}

variable "app_subnet_cidrs" {
  description = "List of app subnet CIDR blocks"
  type        = list(string)
}
