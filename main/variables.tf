variable "region" {
  description = "The AWS region to deploy in"
  type        = string
}

variable "environment" {
  description = "The environment name (e.g., dev, staging, prod)"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "public_subnet_cidrs" {
  description = "List of public subnet CIDR blocks"
  type        = list(string)
}

variable "private_subnet_cidrs" {
  description = "List of private subnet CIDR blocks"
  type        = list(string)
}

variable "web_ami_id" {
  description = "The AMI ID to use for the web servers"
  type        = string
}

variable "web_instance_type" {
  description = "The instance type to use for the web servers"
  type        = string
}

variable "web_min_size" {
  description = "Minimum size of the web Auto Scaling group"
  type        = number
}

variable "web_max_size" {
  description = "Maximum size of the web Auto Scaling group"
  type        = number
}

variable "web_desired_capacity" {
  description = "Desired capacity of the web Auto Scaling group"
  type        = number
}

variable "db_engine" {
  description = "The database engine to use (e.g., mysql, postgres)"
  type        = string
}
variable "db_engine_version" {
  description = "The version of the database engine"
  type        = string
  default     = "8.0.28"
}
variable "db_instance_class" {
  description = "The instance class to use for the database"
  type        = string
}

variable "db_allocated_storage" {
  description = "The allocated storage for the database (in GB)"
  type        = number
}

variable "db_username" {
  description = "The username for the database"
  type        = string
}

variable "db_password" {
  description = "The password for the database"
  type        = string
  sensitive   = true
}
