#Create public subnet for VPC
resource "aws_subnet" "terraform_public_subnet" {
  vpc_id = aws_vpc.terraform_vpc.id
  cidr_block = var.public_subnet_cidr
  availability_zone = var.public_az
  tags = {
    Name=var.public_subnet_name
  }
}
#Create private subnet for vpc
resource "aws_subnet" "terraform_private_subnet" {
  vpc_id = aws_vpc.terraform_vpc.id
  cidr_block = var.private_subnet_cidr
  availability_zone = var.private_az
  tags = {
    Name=var.private_subnet_name
  }
}