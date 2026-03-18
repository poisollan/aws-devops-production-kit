# DevOps Pipeline Architecture

This project demonstrates a complete DevOps workflow using Terraform, Docker, GitHub Actions, and AWS EC2.

---

## Overview

The system automatically builds, publishes, and deploys a containerized application whenever code is pushed to GitHub.

---

## Architecture Flow

Developer
↓
GitHub Repository
↓
GitHub Actions CI/CD Pipeline
↓
Docker Image Build
↓
Push Image to Docker Hub
↓
SSH Deployment to AWS EC2
↓
Docker Container Execution
↓
Flask Web Application

---

## Components Used

Infrastructure as Code
- Terraform
- AWS VPC
- AWS Subnet
- AWS Internet Gateway
- AWS Security Group
- AWS EC2

Containerization
- Docker
- Docker Hub

CI/CD Pipeline
- GitHub Actions

Application
- Flask (Python)

---

## Deployment Process

1. Developer pushes code to GitHub repository.
2. GitHub Actions workflow is triggered.
3. The pipeline builds a Docker image from the Flask application.
4. The Docker image is pushed to Docker Hub.
5. GitHub Actions connects to the EC2 instance using SSH.
6. The old container is stopped and removed.
7. The latest Docker image is pulled from Docker Hub.
8. A new container is started on the EC2 instance.

---

## Infrastructure Provisioning

Terraform automatically creates the following resources:

- VPC
- Public Subnet
- Internet Gateway
- Route Table
- Security Group
- EC2 Instance

The EC2 instance installs Docker automatically using user_data.

---

## CI/CD Workflow

GitHub Actions performs the following tasks:

- Checkout source code
- Authenticate with Docker Hub
- Build Docker image
- Push image to Docker Hub
- Deploy updated container to EC2

---

## Application Access

After deployment, the application can be accessed using:

http://EC2_PUBLIC_IP

Example:

http://44.xxx.xxx.xxx

---

## Summary

This project demonstrates a production-style DevOps pipeline including:

Infrastructure provisioning with Terraform 
Containerized application deployment with Docker 
Automated CI/CD pipeline using GitHub Actions 
Automated deployment to AWS EC2 

This setup represents a foundational DevOps workflow used in many real-world cloud environments.
