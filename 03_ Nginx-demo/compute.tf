

resource "aws_instance" "web" {
  ami                         = "ami-0191ea01412efdb18" //bitnami-nginx-ami
  associate_public_ip_address = true
  instance_type               = "t2.micro"
  availability_zone           = "ap-south-1a"
  subnet_id                   = aws_subnet.public.id
  vpc_security_group_ids      = [aws_security_group.public_http_traffic.id]
  root_block_device {
    delete_on_termination = true
    volume_size           = 10
    volume_type           = "gp3"
  }
  tags = merge(local.common_tags, {
    Name = "Ec2"
  })
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_security_group" "public_http_traffic" {
  description = "security group alowing traffic on port 443 and 80"
  name        = "Public_http_traffic"
  vpc_id      = aws_vpc.main.id
  tags = merge(local.common_tags, {
    Name = "security group"
  })
}

resource "aws_vpc_security_group_ingress_rule" "http" {
  security_group_id = aws_security_group.public_http_traffic
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  to_port           = 80
  ip_protocol       = "tcp"
}

resource "aws_vpc_security_group_ingress_rule" "https" {
  security_group_id = aws_security_group.public_http_traffic
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 443
  to_port           = 443
  ip_protocol       = "tcp"
}

