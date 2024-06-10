output "lb_arn" {
  value = aws_lb.main.arn
}

output "tg_arn" {
  value = aws_lb_target_group.main.arn
}
