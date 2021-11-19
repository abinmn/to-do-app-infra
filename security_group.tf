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