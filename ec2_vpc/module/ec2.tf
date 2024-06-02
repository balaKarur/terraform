#example EC2 instance in private subnet
resource "aws_instance" "web_ins" {
  ami = var.ami
  key_name = var.keyname
  count = 1
  instance_type = var.instance_type
  subnet_id     = aws_subnet.terraform_private_subnet.id
  #security_groups = [aws_security_group.sg.id]
  vpc_security_group_ids = [aws_security_group.sg.id]
  tags = {
    Name = var.mytag
  }
}
