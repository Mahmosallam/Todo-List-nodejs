#create vpc
resource "aws_vpc" "vpc-1" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "first-vpc"
  }
}

#create public subnet
resource "aws_subnet" "public-subnet" {
  vpc_id                  = aws_vpc.vpc-1.id
  cidr_block              = "10.0.0.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "first-subnet"
  }
}

#create security group
resource "aws_security_group" "sg-1" {
  name        = "my-sg"
  description = "Allow SSH and HTTP---S"
  vpc_id      = aws_vpc.vpc-1.id

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

   ingress {
    description = "HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "SG-1"
  }
}

#internet getway

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.vpc-1.id

  tags = {
    Name = "gw-for-public"
  }
}

#create route tabel

resource "aws_route_table" "route-table" {
  vpc_id = aws_vpc.vpc-1.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "My-RouteTable"
  }
}

#connect route tabel to subnet

resource "aws_route_table_association" "my_subnet_association" {
  subnet_id      = aws_subnet.public-subnet.id
  route_table_id = aws_route_table.route-table.id
}

#create ec2 and download python3

resource "aws_instance" "my-ec2-apache" {
  count = 3
  ami   = "ami-0150ccaf51ab55a51" 
  instance_type = "t2.micro" 

  subnet_id              = aws_subnet.public-subnet.id
  vpc_security_group_ids = [aws_security_group.sg-1.id]

  associate_public_ip_address = true

  key_name = "sallam" 
  depends_on = [ aws_s3_bucket.backend-s3 ]
  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y python3
            EOF

  tags = {
    Name = "My-SERVER-EC2-${count.index + 1}"
  }
}

#backend s3 bucket


resource "aws_s3_bucket" "backend-s3" {
  bucket = "backend-tf-test-bucket-sallam"

}