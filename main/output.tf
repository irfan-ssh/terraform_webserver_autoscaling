output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnet_ids" {
  value = module.vpc.public_subnet_ids
}

output "private_subnet_ids" {
  value = module.vpc.private_subnet_ids
}

output "web_sg_id" {
  value = module.security_groups.web_sg_id
}

output "app_sg_id" {
  value = module.security_groups.app_sg_id
}

output "db_sg_id" {
  value = module.security_groups.db_sg_id
}

output "lb_arn" {
  value = module.load_balancer.lb_arn
}

output "tg_arn" {
  value = module.load_balancer.tg_arn
}

output "autoscaling_group_id" {
  value = module.web_server.autoscaling_group_id
}
output "private_key_pem" {
  value = module.web_server.private_key_pem
  sensitive = true
}
output "launch_template_id" {
  description = "Launch Template ID"
  value = module.web_server.launch_template_id
}
output "launch_template_latest_version" {
  description = "Launch Template ID"
  value = module.web_server.launch_template_latest_version
}

output "db_instance_id" {
  value = module.database.db_instance_id
}

