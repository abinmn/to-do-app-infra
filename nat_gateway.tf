resource "aws_eip" "nat_elastic_ip" {
  vpc        = true
  depends_on = [aws_internet_gateway.todo_vpc_gw]
}

resource "aws_nat_gateway" "todo_nat_gateway" {
  allocation_id = aws_eip.nat_elastic_ip.id
  subnet_id     = aws_subnet.todo_public_subnet_1.id
  tags = {
    "Name" = "ToDo-Nat-Gateway"
  }
}

resource "aws_route_table" "todo_nat_gateway" {
  vpc_id = aws_vpc.todo_vpc.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.todo_nat_gateway.id
  }
}

resource "aws_route_table_association" "todo_vpc_private_1_a" {
  subnet_id      = aws_subnet.todo_private_subnet_1.id
  route_table_id = aws_route_table.todo_nat_gateway.id
}

resource "aws_route_table_association" "todo_vpc_private_2_a" {
  subnet_id      = aws_subnet.todo_private_subnet_2.id
  route_table_id = aws_route_table.todo_nat_gateway.id
}
