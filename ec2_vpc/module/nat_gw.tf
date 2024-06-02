#create NAT gateway
resource "aws_nat_gateway" "terraform_NG" {
  allocation_id = aws_eip.terraform_eip.id
  subnet_id     = aws_subnet.terraform_private_subnet.id
}