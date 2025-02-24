#############################
# ec2.tf - EC2 Configuration
#############################
resource "aws_instance" "web" {
  ami                    = var.ec2_ami
  instance_type          = var.ec2_instance_type
  vpc_security_group_ids = [aws_security_group.web_sg.id]
  subnet_id              = aws_subnet.public.id
  tags = { Name = "WebServer" }
}
