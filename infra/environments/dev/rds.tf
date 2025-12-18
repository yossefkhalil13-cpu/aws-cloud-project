resource "aws_db_subnet_group" "app_db_subnets" {
  name       = "app-db-subnet-group-v2"
  subnet_ids = module.vpc.private_subnets
}

resource "aws_db_instance" "app_db" {
  identifier        = "my-app-db-v2"
  engine            = "postgres"
  engine_version    = "15.14"
  instance_class    = "db.t3.micro"
  allocated_storage = 20

  username = "appuser"
  password = "StrongPassword123!"
  port     = 5432

  db_subnet_group_name   = aws_db_subnet_group.app_db_subnets.name
  vpc_security_group_ids = [aws_security_group.rds_sg.id]

  publicly_accessible = false
  skip_final_snapshot = true
}
