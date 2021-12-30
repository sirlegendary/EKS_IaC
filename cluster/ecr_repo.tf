resource "aws_ecr_repository" "my-app" {
  name                 = "my-cool-application"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = false
  }
}