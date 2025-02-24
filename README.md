# 🌍 DevOps Project: AWS Infrastructure Provisioning

🚀 This project automates the provisioning of AWS infrastructure using Terraform. The resources included in this setup are:

- 🖥️ **EC2 Instances**
- 🌐 **VPC (Virtual Private Cloud)**
- 🗄️ **RDS (Relational Database Service)**
- 🔒 **Security Groups**

---

## 📌 Prerequisites
✅ Ensure you have the following installed before running this project:
- 🏗️ [Terraform](https://developer.hashicorp.com/terraform/downloads)
- ☁️ [AWS CLI](https://aws.amazon.com/cli/)
- 🔑 AWS IAM credentials configured with sufficient permissions

---

## 📂 Terraform Directory Structure
```
📂 Project Root
├── 📄 main.tf        # Main Terraform configuration file
├── 📄 variables.tf   # Input variables definition
├── 📄 outputs.tf     # Output values
├── 📄 provider.tf    # AWS provider configuration
├── 📄 vpc.tf         # VPC configuration
├── 📄 ec2.tf         # EC2 instance configuration
├── 📄 rds.tf         # RDS database configuration
├── 📄 security.tf    # Security Groups configuration
└── 📄 terraform.tfvars # Variable values
```

---

## ⚙️ Terraform Configuration

### ☁️ Provider Configuration (`provider.tf`)
```hcl
provider "aws" {
  region = "us-east-1"
}
```

### 🌐 VPC Configuration (`vpc.tf`)
```hcl
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
  enable_dns_support = true
  enable_dns_hostnames = true
  tags = {
    Name = "main-vpc"
  }
}
```

### 🖥️ EC2 Instance Configuration (`ec2.tf`)
```hcl
resource "aws_instance" "web" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.web_sg.id]
  subnet_id     = aws_subnet.main.id

  tags = {
    Name = "WebServer"
  }
}
```

### 🗄️ RDS Configuration (`rds.tf`)
```hcl
resource "aws_db_instance" "default" {
  allocated_storage    = 20
  engine              = "mysql"
  instance_class      = "db.t2.micro"
  username           = "admin"
  password           = "password123"
  vpc_security_group_ids = [aws_security_group.db_sg.id]
  skip_final_snapshot = true
}
```

### 🔒 Security Groups Configuration (`security.tf`)
```hcl
resource "aws_security_group" "web_sg" {
  name        = "web-security-group"
  description = "Allow inbound traffic"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
```

---

## 🚀 Usage

1. **Initialize Terraform** 📦
   ```sh
   terraform init
   ```
2. **Plan the deployment** 📜
   ```sh
   terraform plan
   ```
3. **Apply the configuration** ✅
   ```sh
   terraform apply -auto-approve
   ```
4. **Destroy the infrastructure (if needed)** ❌
   ```sh
   terraform destroy -auto-approve
   ```

---

## 📤 Outputs
After deployment, Terraform will output useful information such as:
```hcl
output "ec2_public_ip" {
  value = aws_instance.web.public_ip
}

output "rds_endpoint" {
  value = aws_db_instance.default.endpoint
}
```

---

## 🤝 Contributing
Feel free to fork this repository and submit pull requests for improvements or additional features.

---

## 📜 License
📝 This project is licensed under the MIT License.
