
resource "aws_instance" "web" {
  ami           = "ami-01711d925a1e4cc3a"
  instance_type = "t3.micro"

  tags = {
    Name = "NGINX"
  }
  vpc_security_group_ids = ["${aws_security_group.nginx.id}"]
  subnet_id              = aws_subnet.comento-private-c.id

  iam_instance_profile = aws_iam_instance_profile.ssm.name
}

resource "aws_security_group" "nginx" {
  name        = "Comento-Web-SG"
  description = "Allow HTTP inbound traffic"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    description = "TLS from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.vpc.cidr_block]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_tls"
  }
}