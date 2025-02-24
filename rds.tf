#############################
# rds.tf - RDS Configuration
#############################
resource "aws_db_instance" "default" {
  allocated_storage      = var.rds_allocated_storage
  engine                = "mysql"
  instance_class        = var.rds_instance_class
  username             = var.rds_username
  password             = var.rds_password
  db_subnet_group_name = aws_db_subnet_group.main.name
  vpc_security_group_ids = [aws_security_group.db_sg.id]
  skip_final_snapshot   = true
}

resource "aws_db_subnet_group" "main" {
  name       = "main"
  subnet_ids = [aws_subnet.private.id]
  tags = { Name = "DB subnet group" }
}
