# 📦 Services Used in AWS DevOps Production Kit

This document explains all the AWS and DevOps services used in this project in a simple way.

---

# 🧠 Why These Services?

Each service is used to make your application:

* Scalable 📈
* Highly available 🌍
* Easy to deploy 🔄
* Production-ready 🚀

---

# ☁️ AWS SERVICES

---

## 🌐 VPC (Virtual Private Cloud)

👉 Think of VPC as your **private network inside AWS**

What it does:

* Isolates your infrastructure
* Controls networking
* Keeps your resources secure

In this project:

* All resources (EC2, ALB) run inside this VPC

---

## 🧩 Subnets

👉 Subnets divide your VPC into smaller networks

In this project:

* 2 Public Subnets are created
* Each subnet is in a different Availability Zone

Why?

* High availability (if one AZ fails, another works)

---

## 🌍 Internet Gateway (IGW)

👉 Allows your VPC to connect to the internet

Without IGW:

* Your app cannot be accessed from browser

---

## 🛣️ Route Tables

👉 Controls how traffic flows in your VPC

In this project:

* Routes internet traffic (`0.0.0.0/0`) to Internet Gateway

---

## 🔐 Security Groups

👉 Acts like a firewall

Rules used:

* Allow SSH (port 22) → for connecting to EC2
* Allow HTTP (port 80) → for accessing app

---

## 🖥️ EC2 (Elastic Compute Cloud)

👉 Virtual servers in AWS

In this project:

* Runs your Docker container
* Hosts your application

---

## ⚖️ Application Load Balancer (ALB)

👉 Distributes traffic across multiple servers

Why we use it:

* Handles user requests
* Improves availability
* Enables scaling

---

## 🎯 Target Group

👉 Group of EC2 instances behind ALB

ALB sends traffic only to:

* Healthy instances

---

## 📡 Listener

👉 Listens for incoming traffic

In this project:

* Listens on port 80 (HTTP)
* Forwards traffic to target group

---

## 📈 Auto Scaling Group (ASG)

👉 Automatically manages EC2 instances

What it does:

* Creates new instances when load increases
* Removes instances when not needed
* Replaces unhealthy instances

---

## 🚀 Launch Template

👉 Blueprint for creating EC2 instances

Includes:

* AMI (OS)
* Instance type
* Docker setup (user_data)
* App deployment

---

## 📊 CloudWatch

👉 Monitoring service

In this project:

* Tracks CPU usage
* Triggers alarms if usage is high

---

# 🐳 DEVOPS SERVICES

---

## 🐳 Docker

👉 Containerizes your application

Why important:

* Same app runs anywhere
* No environment issues

---

## 🐙 GitHub

👉 Stores your code

Also used for:

* triggering CI/CD pipeline

---

## ⚙️ GitHub Actions

👉 Automates your workflow

In this project:

* Builds Docker image
* Pushes image to Docker Hub
* Deploys to EC2

---

## 📦 Docker Hub

👉 Stores your Docker images

Flow:

* GitHub Actions → push image
* EC2 → pulls image

---

# 🔄 COMPLETE FLOW

```text
Developer pushes code
        ↓
GitHub Actions runs
        ↓
Build Docker image
        ↓
Push to Docker Hub
        ↓
EC2 instances pull image
        ↓
App runs inside container
        ↓
ALB serves users
```

---

# 🎯 SUMMARY

This project combines:

* Infrastructure (Terraform)
* Compute (EC2)
* Scaling (ASG)
* Load balancing (ALB)
* Deployment (Docker + CI/CD)
* Monitoring (CloudWatch)

👉 Together, they form a **production-ready DevOps system**

---

# 🚀 Final Thought

Understanding these services is enough to:

* Build real-world systems
* Crack DevOps interviews
* Start freelance projects

---

🔥 You now understand how real AWS systems work!
