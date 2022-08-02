resource "aws_route_table" "public" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }


  tags = {
    Name = "Public_RT"
  }
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat.id
  }


  tags = {
    Name = "Private_RT"
  }
}

resource "aws_route_table_association" "private-a" {
  subnet_id      = aws_subnet.comento-private-a.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "public-a" {
  subnet_id      = aws_subnet.comento-public-a.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "private-c" {
  subnet_id      = aws_subnet.comento-private-c.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "public-c" {
  subnet_id      = aws_subnet.comento-public-c.id
  route_table_id = aws_route_table.public.id
}