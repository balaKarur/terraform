/*
resource "aws_instance" "web1" {
  ami           = var.ami
  instance_type = var.instance_type
  security_groups = [aws_security_group.sg.id]
  subnet_id = var.subnet_id
  #subnet_id = aws_subnet.terraform_subnet_1.id
  #vpc_security_group_ids = [aws_vpc.terraform_vpc.id]
  key_name = var.keyname
  tags = {
    Name=var.mytag
  }
}

 */