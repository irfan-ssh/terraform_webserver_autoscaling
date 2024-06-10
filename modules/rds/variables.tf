variable "name" {
  description = "The name of the environment"
  type        = string
}

variable "engine" {
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
  default     = "db.t3.micro"
}
variable "allocated_storage" {
  description = "The allocated storage for the database (in GB)"
  type        = number
}

variable "username" {
  description = "The username for the database"
  type        = string
}

variable "password" {
  description = "The password for the database"
  type        = string
  sensitive   = true
}

variable "security_group_ids" {
  description = "List of security group IDs"
  type        = list(string)
}

variable "subnet_ids" {
  description = "List of subnet IDs"
  type        = list(string)
}
