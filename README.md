🚀 Strapi Deployment on AWS using Terraform

Private EC2 | ALB | Docker | Modular Infrastructure

📌 Project Overview

This project demonstrates a production-style deployment of a Dockerized Strapi application on AWS using Terraform.

The architecture follows security best practices:

EC2 deployed in a private subnet

Public access handled via Application Load Balancer

Outbound internet through NAT Gateway

Infrastructure managed using modular Terraform structure

Application containerized using Docker

🏗 Architecture Design

User (Internet)
⬇
Application Load Balancer (Public Subnets)
⬇
Target Group (Port 80)
⬇
Private EC2 Instance
⬇
Docker Container (Strapi running on port 1337 → mapped to 80)

🧱 Infrastructure Components
1️⃣ VPC Module

Custom VPC

2 Public Subnets (Multi-AZ for ALB)

1 Private Subnet (EC2)

Internet Gateway

NAT Gateway

Public & Private Route Tables

2️⃣ EC2 Module

Ubuntu-based EC2 instance (Private subnet)

Security group allowing traffic only from ALB

SSH key configuration

Docker installation via user_data

Strapi container deployment

3️⃣ ALB Module

Application Load Balancer (Public Subnets)

Listener on Port 80

Target Group configured on Port 80

Health checks enabled

Target attachment to EC2 instance

🐳 Docker Configuration

Strapi runs inside Docker on EC2.

Port Mapping:

-p 80:1337


Environment Variables Configured:

HOST=0.0.0.0

PORT=1337

APP_KEYS

API_TOKEN_SALT

ADMIN_JWT_SECRET

JWT_SECRET

This ensures Strapi runs correctly in production mode.

📁 Terraform Project Structure
terraform-strapi/
│
├── provider.tf
├── main.tf
├── variables.tf
├── outputs.tf
├── terraform.tfvars
│
└── modules/
    ├── vpc/
    ├── ec2/
    └── alb/


Each module is reusable and follows clean infrastructure separation.

⚙️ Deployment Steps
Initialize Terraform
terraform init

Review Plan
terraform plan

Apply Infrastructure
terraform apply


Type:

yes


Terraform provisions:

VPC

Subnets

NAT Gateway

EC2

ALB

Target Group

Security Groups

🌐 Live Application

Application URL:

http://tf-lb-20260206053658739700000007-470505522.ap-south-1.elb.amazonaws.com

Admin Panel:

http://tf-lb-20260206053658739700000007-470505522.ap-south-1.elb.amazonaws.com/admin

🔐 Security Implementation

EC2 is not publicly accessible

Only ALB exposes public endpoint

Private subnet uses NAT Gateway for outbound internet

Security groups restrict traffic flow

Proper health checks ensure availability

🛠 Debugging & Improvements Handled

Fixed 502 Bad Gateway (Port mismatch between ALB and Docker)

Updated Target Group from 1337 → 80

Implemented create_before_destroy to avoid ALB dependency conflicts

Added required Strapi production secrets

Ensured Docker container restart policy

📦 Environment Management

Environment values are managed using:

terraform.tfvars


This allows easy switching between development and production configurations.

📚 Key Learnings

Modular Terraform architecture

Private EC2 deployment pattern

ALB health check debugging

Docker production configuration

Target group lifecycle handling

AWS networking fundamentals

🔗 GitHub Repository

https://github.com/namitagrawal2001/terraform-strapi-aws-task4.git

Loom video https://drive.google.com/file/d/16hEGGYXZgQRDaDmtEehUPHO8qYZuWVjC/view?usp=sharing

👨‍💻 Author

Namit Agrawal
DevOps & Cloud Enthusiast
