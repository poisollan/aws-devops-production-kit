# DevOps Starter Kit – Setup Guide

This guide explains how to deploy the project using Terraform, Docker, and GitHub Actions.

---

## 1. Prerequisites

Before starting, make sure you have:

- AWS Account
- Docker Hub Account
- GitHub Account
- Git installed
- Terraform installed
- AWS CLI installed

---

## 2. Clone the Repository

Clone the project repository:

git clone https://github.com/YOUR_USERNAME/aws-terraform-devops-starter.git
cd aws-terraform-devops-starter

---

## 3. Create AWS Key Pair

Go to AWS Console:

EC2 → Key Pairs → Create Key Pair

Example key name:

devops-key

Download the .pem file and store it safely.

Place the .pem file inside your local project directory.

---

## 4. Configure Terraform Variables

Open the file:

variables.tf

Update the values if necessary.

Example:

region = "us-east-1"
instance_type = "t2.micro"
key_name = "devops-key"

---

## 5. Configure AWS Credentials

Run:

aws configure

Enter your credentials:

AWS Access Key 
AWS Secret Access Key 
Region 
Output format 

---

## 6. Deploy Infrastructure

Initialize Terraform:

terraform init

Preview resources:

terraform plan

Deploy infrastructure:

terraform apply

Terraform will create the following resources:

- VPC
- Public Subnet
- Internet Gateway
- Route Table
- Security Group
- EC2 Instance

After deployment Terraform will output:

website_ip

Example:

http://44.xxx.xxx.xxx

---

## 7. Build and Push Docker Image

The project includes a Flask application container.

GitHub Actions automatically performs the following steps:

1. Builds the Docker image
2. Pushes the image to Docker Hub
3. Deploys the container to EC2

---

## 8. Configure GitHub Secrets

In your GitHub repository navigate to:

Settings → Secrets and variables → Actions

Add the following secrets:

DOCKERHUB_USERNAME 
DOCKERHUB_TOKEN 
EC2_HOST 
EC2_USERNAME 
EC2_SSH_KEY 

Example values:

EC2_HOST = your EC2 public IP 
EC2_USERNAME = ec2-user 
EC2_SSH_KEY = contents of your .pem file 
DOCKERHUB_USERNAME = your Docker Hub username 
DOCKERHUB_TOKEN = Docker Hub access token 

---

## 9. Trigger the CI/CD Pipeline

Push any code change to the repository:

git add .
git commit -m "deploy update"
git push

GitHub Actions will automatically:

- Build the Docker image
- Push the image to Docker Hub
- SSH into the EC2 instance
- Deploy the latest container

---

## 10. Access the Application

Open your browser and visit:

http://YOUR_EC2_PUBLIC_IP

Your Flask application should now be running.

---

## Deployment Architecture

Developer 
↓ 
GitHub Repository 
↓ 
GitHub Actions 
↓ 
Docker Hub 
↓ 
EC2 Instance 
↓ 
Docker Container 
↓ 
Flask Application 

---

## Destroy Infrastructure

To remove all AWS resources created by Terraform:

terraform destroy

---

## Support

If you encounter issues, review:

- Terraform logs
- GitHub Actions workflow logs
- Docker container logs

---

Enjoy your DevOps pipeline 🚀
