#############################
# variables.tf - Variables Definition
#############################
variable "aws_region" {
  default = "us-east-1"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "private_subnet_cidr" {
  default = "10.0.1.0/24"
}

variable "public_subnet_cidr" {
  default = "10.0.2.0/24"
}

variable "ec2_ami" {
  default = "ami-0c55b159cbfafe1f0"
}

variable "ec2_instance_type" {
  default = "t2.micro"
}

variable "rds_allocated_storage" {
  default = 20
}

variable "rds_instance_class" {
  default = "db.t2.micro"
}

variable "rds_username" {
  default = "admin"
}

variable "rds_password" {
  default = "password123"
}
