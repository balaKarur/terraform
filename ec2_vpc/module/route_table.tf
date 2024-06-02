#Create router table for vpc
resource "aws_route_table" "terraform_public_rt" {
  vpc_id = aws_vpc.terraform_vpc.id
  tags = {
    Name=var.public_rt_tag_name
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

#create a route table for private subnet
resource "aws_route_table" "terraform_private_rt" {
  vpc_id = aws_vpc.terraform_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.terraform_NG.id
  }
  tags = {
    Name = var.private_rt_tag_name
  }
}
#Associate route table with private subnet
resource "aws_route_table_association" "terraform_private_rt" {
  route_table_id = aws_route_table.terraform_private_rt.id
  subnet_id = aws_subnet.terraform_private_subnet.id
}