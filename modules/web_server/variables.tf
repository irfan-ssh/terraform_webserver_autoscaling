# variable "name" {
#   description = "The name of the environment"
#   type        = string
# }

# variable "ami_id" {
#   description = "The AMI ID to use for the web servers"
#   type        = string
# }

# variable "instance_type" {
#   description = "The instance type to use for the web servers"
#   type        = string
# }

# variable "security_group_ids" {
#   description = "List of security group IDs"
# }

# variable "subnet_ids" {
#   description = "List of subnet IDs"
#   type        = list(string)
# }

# variable "target_group_arns" {
#   description = "List of target group ARNs"
#   type        = list(string)
# }

# variable "min_size" {
#   description = "Minimum size of the Auto Scaling group"
#   type        = number
# }

# variable "max_size" {
#   description = "Maximum size of the Auto Scaling group"
#   type        = number
# }

# variable "desired_capacity" {
#   description = "Desired capacity of the Auto Scaling group"
#   type        = number
# }


variable "name" {
  description = "Name prefix for resources"
  type        = string
}

variable "ami_id" {
  description = "The AMI ID to use for the web servers"
  type        = string
}

variable "instance_type" {
  description = "The instance type to use for the web servers"
  type        = string
}

variable "min_size" {
  description = "Minimum size of the web Auto Scaling group"
  type        = number
}

variable "max_size" {
  description = "Maximum size of the web Auto Scaling group"
  type        = number
}

variable "desired_capacity" {
  description = "Desired capacity of the web Auto Scaling group"
  type        = number
}

variable "security_group_ids" {
  description = "Security group IDs for the web servers"
  type        = list(string)
}

variable "subnet_ids" {
  description = "Subnet IDs for the web servers"
  type        = list(string)
}

variable "target_group_arns" {
  description = "Target group ARNs for the web servers"
  type        = list(string)
}
