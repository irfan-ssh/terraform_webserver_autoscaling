resource "tls_private_key" "instance_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "webserver_key_pair" {
  key_name   = "${var.name}-webserver-key"
  public_key = tls_private_key.instance_key.public_key_openssh

  # Generate .pem file in the current directory
  provisioner "local-exec" {
    command = <<-EOT
        echo '${tls_private_key.instance_key.private_key_pem}' > '${var.name}-webserver-key'.pem
        chmod 400 '${var.name}-webserver-key'.pem
      EOT
  }
}

resource "local_file" "key" {
  filename = "${var.name}-webserver-key.pem"
  content  = <<EOF
  ${tls_private_key.instance_key.private_key_pem}
  EOF
}
resource "aws_launch_template" "web" {
  name_prefix   = "${var.name}-web-template"
  description = "custom aws_launch_template for webserver"
  image_id      = var.ami_id
  instance_type = var.instance_type
  key_name      = aws_key_pair.webserver_key_pair.key_name
  network_interfaces {
    associate_public_ip_address = true
    security_groups = var.security_group_ids
    subnet_id       = element(var.subnet_ids, 0)  # Only for creating the template, ASG will use all subnets
  }
  user_data = filebase64("${path.module}./user_data.sh")
  update_default_version = true
  block_device_mappings {
    device_name = "/dev/sda1"
    ebs {
      volume_size = 10 
      #volume_size = 20 # LT Update Testing - Version 2 of LT      
      delete_on_termination = true
      volume_type = "gp2" # default is gp2
     }
  }
  lifecycle {
    create_before_destroy = true
  }
  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "${var.name}-web-asg"
    }
  }
}

resource "aws_autoscaling_group" "web" {
  launch_template {
    id      = aws_launch_template.web.id
    version = "$Latest"
  }
  min_size             = var.min_size
  max_size             = var.max_size
  desired_capacity     = var.desired_capacity
  vpc_zone_identifier  = var.subnet_ids
  target_group_arns    = var.target_group_arns
  health_check_type = "EC2"
  health_check_grace_period = 300
  instance_refresh {
    strategy = "Rolling"
    preferences {
      #instance_warmup = 300 # Default behavior is to use the Auto Scaling Group's health check grace period.
      min_healthy_percentage = 50
    }
    triggers = [ /*"launch_template",*/ "desired_capacity" ] # You can add any argument from ASG here, if those has changes, ASG Instance Refresh will trigger
  }
  tag {
    key                 = "Name"
    value               = "${var.name}-web"
    propagate_at_launch = true
  }

  lifecycle {
    create_before_destroy = true
  }
}
