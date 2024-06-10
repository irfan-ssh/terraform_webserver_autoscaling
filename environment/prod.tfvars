region               = "us-east-1"
environment          = "prod"
vpc_cidr             = "10.0.0.0/16"
public_subnet_cidrs  = ["10.0.10.0/24", "10.0.20.0/24"]
private_subnet_cidrs = ["10.0.30.0/24", "10.0.40.0/24"]
web_ami_id           = "ami-04b70fa74e45c3917"
web_instance_type    = "t2.micro"
web_desired_capacity = 1
web_min_size         = 1
web_max_size         = 3
db_engine            = "mysql"
db_engine_version    = "8.0.35"
db_instance_class    = "db.t3.micro"
db_allocated_storage = 20
db_username          = "admin"
db_password          = "password"