#Create internet gatway
resource "aws_internet_gateway" "terraform_IG" {
  vpc_id = aws_vpc.terraform_vpc.id
  tags = {
    Name=var.IG_tag_name
  }
}