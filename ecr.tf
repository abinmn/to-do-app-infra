resource "aws_ecr_repository" "ecr_todo_app" {
  name                 = "to-do-app"
  image_tag_mutability = "IMMUTABLE"
}