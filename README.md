# AWS Cloud Project – ECS + Terraform + CI/CD

## 📌 Overview

This project is a hands-on AWS cloud implementation built to practice real-world infrastructure provisioning and deployment workflows.

The application is containerized using Docker and deployed on Amazon ECS (Fargate).  
Traffic is routed through CloudFront and protected with AWS WAF before reaching an Application Load Balancer that forwards requests to the ECS service.  
The backend connects to a PostgreSQL database hosted on Amazon RDS, with sensitive credentials securely managed using AWS Secrets Manager.

The main focus of this project was understanding how different AWS services integrate together in a production-style environment using Infrastructure as Code and CI/CD automation.

---

## 🏗 Architecture

**Traffic Flow:**

User  
→ CloudFront  
→ AWS WAF  
→ Application Load Balancer (ALB)  
→ ECS Service (Fargate)  
→ RDS PostgreSQL  

---

## 🧱 AWS Services & Tools Used

- Amazon VPC (public & private subnets)
- Internet Gateway & NAT Gateway
- Application Load Balancer (ALB)
- Amazon ECS (Fargate)
- Amazon ECR
- Amazon RDS (PostgreSQL)
- AWS Secrets Manager
- AWS IAM (roles & policies)
- AWS WAF
- Amazon CloudFront
- Amazon CloudWatch Logs
- Terraform (Infrastructure as Code)
- GitHub Actions (CI/CD)
- Docker

---

## ⚙️ Infrastructure as Code (Terraform)

- All AWS resources are provisioned using Terraform.
- Infrastructure is modularized (VPC module).
- Separate environment structure (`dev`) for clarity and scalability.
- State and provider configuration follow Terraform best practices.
- Secrets are never hardcoded and are managed via AWS Secrets Manager.

---

## 🚀 CI/CD Pipeline

A CI/CD pipeline is implemented using **GitHub Actions**:

- Triggered automatically on every push to the `main` branch.
- Builds a Docker image for the application.
- Pushes the image to Amazon ECR.
- Forces a new deployment on the ECS service to deploy the latest image.

This ensures consistent, automated, and repeatable deployments.

---

## 📂 Project Structure

```text
aws-cloud-project/
│
├── app/                         # Application source code
│   ├── Dockerfile
│   ├── package.json
│   └── src/
│       └── index.js
│
├── infra/                       # Terraform infrastructure
│   ├── modules/
│   │   └── vpc/
│   │       ├── main.tf
│   │       └── outputs.tf
│   │
│   └── environments/
│       └── dev/
│           ├── provider.tf
│           ├── versions.tf
│           ├── main.tf
│           ├── alb.tf
│           ├── ecs_cluster.tf
│           ├── ecs_task_definition.tf
│           ├── ecs_service.tf
│           ├── ecr.tf
│           ├── rds.tf
│           ├── secrets.tf
│           ├── security_groups.tf
│           ├── cloudfront.tf
│           ├── waf.tf
│           └── outputs.tf
│
├── .github/
│   └── workflows/
│       └── deploy.yml           # GitHub Actions CI/CD pipeline
│
├── .gitignore
└── README.md



