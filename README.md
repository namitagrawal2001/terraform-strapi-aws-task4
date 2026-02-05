🚀 Strapi Deployment on AWS using Terraform (Private EC2 + ALB + Docker)
📌 Project Overview

This project provisions a production-ready AWS infrastructure using Terraform.

It includes:

Custom VPC

Public and Private Subnets

Internet Gateway

NAT Gateway

Private EC2 instance

Application Load Balancer

Security Groups

Docker installation via user_data

Strapi CMS running inside Docker

Environment-specific configuration using tfvars

Strapi runs inside a private EC2 instance and is accessed through a public Application Load Balancer.

🏗 Architecture

User → ALB (Public Subnet) → Private EC2 → Docker → Strapi

ALB receives HTTP traffic on Port 80

Traffic forwarded to EC2 on Port 1337

EC2 runs Strapi inside Docker

NAT Gateway provides outbound internet to private EC2

📂 Project Structure
terraform-strapi/
│
├── provider.tf
├── main.tf
├── variables.tf
├── outputs.tf
├── terraform.tfvars
│
├── modules/
│   ├── vpc/
│   ├── ec2/
│   └── alb/

⚙️ Prerequisites

AWS CLI configured

Terraform installed

IAM user with AdministratorAccess

SSH key created and imported into AWS

🔐 SSH Key Setup
ssh-keygen -t rsa -b 2048 -f strapi-key

aws ec2 import-key-pair \
  --key-name strapi-key \
  --public-key-material fileb://strapi-key.pub

🚀 Deployment Steps
1️⃣ Initialize Terraform
terraform init

2️⃣ Validate
terraform validate

3️⃣ Apply
terraform apply


Type yes when prompted.

🌍 Access Application

After deployment, the Application Load Balancer DNS generated:

tf-lb-20260205102029882100000008-893997406.ap-south-1.elb.amazonaws.com

🔗 Open Application
http://tf-lb-20260205102029882100000008-893997406.ap-south-1.elb.amazonaws.com

🔐 Strapi Admin Panel
http://tf-lb-20260205102029882100000008-893997406.ap-south-1.elb.amazonaws.com/admin

🐳 Docker Deployment

Docker is installed automatically using user_data.sh.

Strapi runs inside a Docker container on:

Port 1337


The ALB forwards traffic from port 80 to port 1337 on the private EC2 instance.

🛠 Environment Configuration

All environment-specific values are managed using:

terraform.tfvars


Configurable variables include:

region

instance_type

VPC CIDR

subnet CIDRs

AMI ID

key_name

🧹 Destroy Infrastructure

To remove all resources:

terraform destroy

✅ Outcome

Infrastructure provisioned using Terraform modules

Private EC2 securely deployed

ALB configured for public access

Dockerized Strapi running successfully

Fully reproducible infrastructure

Environment separation using tfvars

👨‍💻 Author

Namit Agrawal
DevOps & Cloud Enthusiast
