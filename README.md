# AWS Multi-Tier Architecture with Terraform

    terraform init
    terraform plan -var-file="../environments/dev.tfvars"
    terraform apply -var-file="../environments/dev.tfvars" -auto-approve
    terraform destroy -var-file="../environments/dev.tfvars" -auto-approve

This project uses Terraform to deploy a highly available, scalable, and secure multi-tier architecture on AWS. The architecture consists of the following tiers:
- Web Tier
- Application Tier
- Database Tier

## Overview

### Web Tier
- Load Balancer: Distributes traffic across multiple web servers.
- Auto Scaling: Adjusts the number of web servers based on traffic.
- Security Groups: Controls incoming and outgoing traffic to the web servers.
- Subnets: Uses public subnets.

### Application Tier
- Load Balancer: Distributes traffic to the application servers.
- Auto Scaling: Adjusts the number of application servers based on traffic.
- Security Groups: Controls incoming and outgoing traffic to the application servers.
- Subnets: Uses private subnets, no NAT gateway.

### Database Tier
- Amazon RDS: Managed database service for MySQL/PostgreSQL/SQL Server.
- Security Groups: Controls incoming and outgoing traffic to the database.
- Subnets: Uses private subnets, no NAT gateway.
