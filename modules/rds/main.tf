resource "aws_db_instance" "main" {
  identifier = "${var.name}-db"
  engine     = var.engine
  engine_version         = var.db_engine_version
  instance_class = var.db_instance_class
  allocated_storage = var.allocated_storage
  username          = var.username
  password          = var.password
  vpc_security_group_ids = var.security_group_ids
  db_subnet_group_name  = aws_db_subnet_group.main.name
  skip_final_snapshot  = true
  
  tags = {
    Name = "${var.name}-db"
  }
}

resource "aws_db_subnet_group" "main" {
  name       = "${var.name}-db-subnet-group"
  subnet_ids = var.subnet_ids

  tags = {
    Name = "${var.name}-db-subnet-group"
  }
}
