#create Elastic IP for NAT gateway
resource "aws_eip" "terraform_eip" {
  domain = "vpc"
  tags = {
    Name = var.eip_name
  }
}