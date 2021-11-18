resource "aws_ecr_repository" "ecr_todo_app" {
  name                 = "to-do-app"
  image_tag_mutability = "IMMUTABLE"
}

resource "aws_vpc_endpoint" "ecr_api" {
  vpc_id              = aws_vpc.todo_vpc.id
  service_name        = "com.amazonaws.eu-central-1.ecr.api"
  vpc_endpoint_type   = "Interface"
  private_dns_enabled = true
  subnet_ids = [
    aws_subnet.todo_private_subnet_1.id,
    aws_subnet.todo_private_subnet_2.id
  ]

  security_group_ids = [
    aws_security_group.endpoint_ecr.id,
  ]
}