#############################
# terraform.tfvars - Variable Values
#############################
aws_region = "us-east-1"
vpc_cidr = "10.0.0.0/16"
private_subnet_cidr = "10.0.1.0/24"
public_subnet_cidr = "10.0.2.0/24"
ec2_ami = "ami-0c55b159cbfafe1f0"
ec2_instance_type = "t2.micro"
rds_allocated_storage = 20
rds_instance_class = "db.t2.micro"
rds_username = "admin"
rds_password = "password123"

