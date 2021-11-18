# Internet VPC
resource "aws_vpc" "todo_vpc" {
  cidr_block           = "10.0.0.0/16"
  instance_tenancy     = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  enable_classiclink   = "false"
  tags = {
    Name = "todo_vpc"
  }
}

# Subnets
resource "aws_subnet" "todo_public_subnet_1" {
  vpc_id                  = aws_vpc.todo_vpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "eu-central-1a"

  tags = {
    Name = "todo_public_subnet_1"
  }
}

resource "aws_subnet" "todo_public_subnet_2" {
  vpc_id                  = aws_vpc.todo_vpc.id
  cidr_block              = "10.0.2.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "eu-central-1b"

  tags = {
    Name = "todo_public_subnet_2"
  }
}


resource "aws_subnet" "todo_private_subnet_1" {
  vpc_id                  = aws_vpc.todo_vpc.id
  cidr_block              = var.PRIVATE_SUBNET_1_CIDR_BLOCK
  map_public_ip_on_launch = "false"
  availability_zone       = "eu-central-1a"

  tags = {
    Name = "todo_private_subnet_1"
  }
}

resource "aws_subnet" "todo_private_subnet_2" {
  vpc_id                  = aws_vpc.todo_vpc.id
  cidr_block              = var.PRIVATE_SUBNET_2_CIDR_BLOCK
  map_public_ip_on_launch = "false"
  availability_zone       = "eu-central-1b"

  tags = {
    Name = "todo_private_subnet_2"
  }
}


# Internet GW
resource "aws_internet_gateway" "todo_vpc_gw" {
  vpc_id = aws_vpc.todo_vpc.id

  tags = {
    Name = "todo_vpc_gw"
  }
}


# route tables
resource "aws_route_table" "todo_vpc_public_route_table" {
  vpc_id = aws_vpc.todo_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.todo_vpc_gw.id
  }

  tags = {
    Name = "todo_vpc_public_route_table"
  }
}

# route associations public
resource "aws_route_table_association" "todo_vpc_public_1_a" {
  subnet_id      = aws_subnet.todo_public_subnet_1.id
  route_table_id = aws_route_table.todo_vpc_public_route_table.id
}

resource "aws_route_table_association" "todo_vpc_public_2_a" {
  subnet_id      = aws_subnet.todo_public_subnet_2.id
  route_table_id = aws_route_table.todo_vpc_public_route_table.id
}

