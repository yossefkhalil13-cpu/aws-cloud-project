resource "aws_ecs_cluster" "app_cluster" {
  name = "app-cluster"

  setting {
    name  = "containerInsights"
    value = "enabled"
  }

  tags = {
    Name = "app-cluster"
  }
}
