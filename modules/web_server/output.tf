output "autoscaling_group_id" {
  value = aws_autoscaling_group.web.id
}

output "private_key_pem" {
  value = tls_private_key.instance_key.private_key_pem
  sensitive = true
}

output "launch_template_id" {
  description = "Launch Template ID"
  value = aws_launch_template.web.id
}

output "launch_template_latest_version" {
  description = "Launch Template Latest Version"
  value = aws_launch_template.web.latest_version
}