resource "aws_subnet" "comento-public-a" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "10.10.0.0/27"
  availability_zone  = "ap-northeast-2a"
  tags = {
    Name = "Public-ELB-A"
  }
}

resource "aws_subnet" "comento-public-c" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "10.10.0.32/27"
  availability_zone  = "ap-northeast-2c"
  tags = {
    Name = "Public-ELB-C"
  }
}

resource "aws_subnet" "comento-private-a" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "10.10.0.64/27"
  availability_zone  = "ap-northeast-2a"
  tags = {
    Name = "Private-A"
  }
}

resource "aws_subnet" "comento-private-c" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "10.10.0.96/27"
  availability_zone  = "ap-northeast-2c"
  tags = {
    Name = "Private-C"
  }
}
