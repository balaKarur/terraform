resource "aws_instance" "web-server" {
  ami = "ami-01e59100ba48a7d3c"
  key_name = "neptune"
  instance_type = "t2.micro"
  subnet_id     = "subnet-0c0114228a46f2cd8"
  security_groups = ["sg-063b0f05b58823bba"]
  tags = {
    Name = "webserver1"
  }
}