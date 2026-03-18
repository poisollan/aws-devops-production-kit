variable "aws_region" {
  default = "us-east-1"
}

variable "project_name" {
  default = "devops-kit"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "public_subnet_1_cidr" {
  default = "10.0.1.0/24"
}

variable "public_subnet_2_cidr" {
  default = "10.0.2.0/24"
}

variable "availability_zone_1" {
  default = "us-east-1a"
}

variable "availability_zone_2" {
  default = "us-east-1b"
}

variable "instance_type" {
  default = "t3.micro"
}

variable "key_name" {}

variable "docker_image" {}

variable "cpu_target_value" {
  description = "Target CPU utilization for scaling"
  type        = number
  default     = 50
}