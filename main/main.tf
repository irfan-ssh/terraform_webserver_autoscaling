

module "vpc" {
  source = "../modules/vpc"

  cidr_block         = var.vpc_cidr
  name               = var.environment
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
}

module "security_groups" {
  source = "../modules/sg"
  vpc_id = module.vpc.vpc_id
  name   = var.environment
  web_subnet_cidrs = var.public_subnet_cidrs
  app_subnet_cidrs = var.private_subnet_cidrs
}

module "load_balancer" {
  source = "../modules/alb"
  vpc_id             = module.vpc.vpc_id
  name               = var.environment
  security_group_ids = [module.security_groups.web_sg_id]
  subnet_ids         = module.vpc.public_subnet_ids
}

module "database" {
  source = "../modules/rds"
  name               = var.environment
  engine             = var.db_engine
  db_engine_version = var.db_engine_version
  db_instance_class     = var.db_instance_class
  allocated_storage  = var.db_allocated_storage
  username           = var.db_username
  password           = var.db_password
  security_group_ids = [module.security_groups.db_sg_id]
  subnet_ids         = module.vpc.private_subnet_ids 
}


module "web_server" {
  source              = "../modules/web_server"
  name                = var.environment
  ami_id              = var.web_ami_id
  instance_type       = var.web_instance_type
  min_size            = var.web_min_size
  max_size            = var.web_max_size
  desired_capacity    = var.web_desired_capacity
  security_group_ids  = [module.security_groups.web_sg_id]
  subnet_ids          = module.vpc.public_subnet_ids
  target_group_arns   = [module.load_balancer.tg_arn]
}
