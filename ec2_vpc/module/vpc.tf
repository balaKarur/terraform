#Create vpc
resource "aws_vpc" "terraform_vpc" {
  cidr_block = "1.0.0.0/16"
  instance_tenancy = "default"
  tags = {
    Name="terraform_vpc"
  }
}
#Create public subnet for VPC
resource "aws_subnet" "terraform_public_subnet" {
  vpc_id = aws_vpc.terraform_vpc.id
  cidr_block = "1.0.0.0/26"
  availability_zone = "us-west-2a"
  tags = {
    Name="terraform_public_subnet"
  }
}
#Create private subnet for vpc
resource "aws_subnet" "terraform_private_subnet" {
  vpc_id = aws_vpc.terraform_vpc.id
  cidr_block = "1.0.1.0/26"
  availability_zone = "us-west-2b"
  tags = {
    Name="terraform_private_subnet"
  }
}

#Create internet gatway
resource "aws_internet_gateway" "terraform_IG" {
  vpc_id = aws_vpc.terraform_vpc.id
  tags = {
    Name="terraform_IG"
  }
}
#Create router table for vpc
resource "aws_route_table" "terraform_public_rt" {
  vpc_id = aws_vpc.terraform_vpc.id
  tags = {
    Name="terraform_rt"
  }
}
# Create a route in the route table to direct traffic to the Internet Gateway
resource "aws_route" "terraform_route" {
  route_table_id = aws_route_table.terraform_public_rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.terraform_IG.id
}
#Associate the route table with public subnet
resource "aws_route_table_association" "terraform_public_subnet" {
  route_table_id = aws_route_table.terraform_public_rt.id
  subnet_id = aws_subnet.terraform_public_subnet.id
}
#create Elastic IP for NAT gateway
resource "aws_eip" "terraform_eip" {
  domain = "vpc"

  tags = {
    Name = "terraform_eip"
  }

}
#create NAT gateway
resource "aws_nat_gateway" "terraform_NG" {
  allocation_id = aws_eip.terraform_eip.id
  subnet_id     = aws_subnet.terraform_private_subnet.id
}
#create a route table for private subnet
resource "aws_route_table" "terraform_private_rt" {
  vpc_id = aws_vpc.terraform_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.terraform_NG.id
  }
  tags = {
    Name = "terraform_private_rt"
  }
}
#Associate route table with private subnet
resource "aws_route_table_association" "terraform_private_rt" {
  route_table_id = aws_route_table.terraform_private_rt.id
  subnet_id = aws_subnet.terraform_private_subnet.id
}

#example EC2 instance in private subnet
resource "aws_instance" "web_ins" {
  ami = "ami-01e59100ba48a7d3c"
  key_name = "neptune"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.terraform_private_subnet.id
  #security_groups = [aws_security_group.sg.id]
  vpc_security_group_ids = [aws_security_group.sg.id]
tags = {
    Name = "webserver1"
  }
}


