resource "aws_ecr_repository" "app_repo" {
  name = "my-app-repo"

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    Name = "my-app-repo"
  }
}
