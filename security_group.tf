resource "aws_security_group" "todo_app_security_group" {
  vpc_id      = aws_vpc.todo_vpc.id
  name        = "todo-app-sg"
  description = "security group for eks cluster"
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = var.DEVELOPER_IPS
  }

  tags = {
    Name = "todo-app-sg"
  }
}

resource "aws_security_group" "endpoint_ecr" {
  vpc_id      = aws_vpc.todo_vpc.id
  name        = "endpoint-ecr-sg"
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [
    var.PRIVATE_SUBNET_1_CIDR_BLOCK,
    var.PRIVATE_SUBNET_2_CIDR_BLOCK
  ]
  }
  tags = {
    Name = "endpoint-ecr-sg"
  }
}
