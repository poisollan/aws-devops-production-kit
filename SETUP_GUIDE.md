# 🚀 AWS DevOps Production Kit – Beginner Friendly Setup Guide

Don’t worry if you are new to DevOps.
Follow this guide step-by-step and your project will run successfully.

---

# 🧠 What You Are Building

You are going to deploy:

* A web app (Flask)
* Running inside Docker
* Hosted on AWS EC2
* Load balanced using ALB
* Auto-scaled using Auto Scaling Group
* Automatically built using GitHub Actions

---

# ⚠️ Before You Start

Make sure you have:

✅ AWS account
✅ GitHub account
✅ Docker Hub account

And install these on your system:

```bash
Terraform
AWS CLI
Docker
Git
```

---

# 🔑 STEP 1 – Clone the Project

Open terminal and run:

```bash
git clone https://github.com/YOUR_USERNAME/aws-devops-production-kit.git
cd aws-devops-production-kit
```

---

# 🔑 STEP 2 – Configure AWS

Run:

```bash
aws configure
```

Enter:

* AWS Access Key
* AWS Secret Key
* Region → `us-east-1`

---

# 🔑 STEP 3 – Create Key Pair in AWS

Go to AWS Console → EC2 → Key Pairs

Create a key:

```text
Name: devops-key
```

Download the `.pem` file.

Move it safely:

```bash
mkdir -p ~/.ssh/devops-keys
mv devops-key.pem ~/.ssh/devops-keys/
chmod 400 ~/.ssh/devops-keys/devops-key.pem
```

---

# 🔑 STEP 4 – Configure Terraform Variables

Go to terraform folder:

```bash
cd terraform
```

Create file:

```bash
nano terraform.tfvars
```

Paste:

```hcl
aws_region           = "us-east-1"
project_name         = "devops-kit"

vpc_cidr             = "10.0.0.0/16"
public_subnet_1_cidr = "10.0.1.0/24"
public_subnet_2_cidr = "10.0.2.0/24"

availability_zone_1  = "us-east-1a"
availability_zone_2  = "us-east-1b"

instance_type = "t3.micro"
key_name      = "devops-key"

docker_image  = "YOUR_DOCKERHUB_USERNAME/mohan-flask-app:latest"
```

👉 Replace `YOUR_DOCKERHUB_USERNAME`

---

# 🔑 STEP 5 – Deploy Infrastructure

Run:

```bash
terraform init
terraform apply -auto-approve
```

Wait 2–3 minutes.

---

# 🌐 STEP 6 – Get Your App URL

Run:

```bash
terraform output
```

You will see:

```text
http://xxxx.alb.amazonaws.com
```

Open it in browser.

---

# 🐳 STEP 7 – Push Your App to Docker Hub

Go back to project root:

```bash
cd ..
```

Build image:

```bash
docker build -t YOUR_DOCKERHUB_USERNAME/mohan-flask-app:latest ./app
```

Login:

```bash
docker login
```

Push:

```bash
docker push YOUR_DOCKERHUB_USERNAME/mohan-flask-app:latest
```

---

# 🔄 STEP 8 – Setup GitHub Actions (CI/CD)

Go to GitHub → Your Repo → Settings → Secrets

Add:

### 1. Docker Hub Username

```text
DOCKERHUB_USERNAME
```

### 2. Docker Hub Token

```text
DOCKERHUB_TOKEN
```

---

# 🔁 STEP 9 – Trigger Deployment

Push any change:

```bash
git add .
git commit -m "trigger deployment"
git push
```

GitHub Actions will:

* build Docker image
* push to Docker Hub

---

# 🔄 STEP 10 – Refresh Instances

Go to AWS → EC2 → Instances

Terminate running instances.

Auto Scaling will create new ones automatically.

---

# 🎯 Done!

Now open your ALB URL again.

You should see:

```text
AWS DevOps Production Kit is running successfully!
```

---

# 🛠 Troubleshooting

### ❌ App not loading

* Wait 2 minutes
* Check Target Group → Health = healthy

### ❌ Docker not running

SSH into instance:

```bash
ssh -i ~/.ssh/devops-keys/devops-key.pem ec2-user@<public-ip>
docker ps
```

---

# 💸 Important (Cost)

* ALB may cost small amount
* Always destroy after testing:

```bash
cd terraform
terraform destroy -auto-approve
```

---

# 🚀 You Built

* Scalable AWS system
* CI/CD pipeline
* Containerized app
* Production-style infra

---

# 💡 Next Steps

* Add HTTPS
* Use ECR
* Add logging
* Improve scaling

---

🔥 You now have a real DevOps project!
