#Usecase
#create ec2 ins with additional 1 GB
#Steps:
#1)Create Ec2 instance
#2)Create Elastic block store volume
#3)Attach EBS volumen to EC2 ins

resource "aws_instance" "web-server" {
  ami = "ami-01e59100ba48a7d3c"
  key_name = "neptune"
  instance_type = "t2.micro"
  subnet_id     = "subnet-0c0114228a46f2cd8"
  security_groups = ["sg-063b0f05b58823bba"]

  root_block_device {
    volume_size = 7 # Size in GB
    volume_type = "gp2"
  }
  tags = {
    Name = "webserver1"
  }
}
#Create an EBS volume
resource "aws_ebs_volume" "create_volume" {
  availability_zone = "us-west-2"
  size = 1 # Size in GB
  tags = {
    Name = "EC2 Volume"
  }
}

#Attach teh additional EBS volume to EC2 instance
resource "aws_volume_attachment" "attach_volume_to_ec2" {
  #device_name = "/dev/sdh"
  device_name = "/dev/xvda"
  instance_id = aws_instance.web-server.id
  volume_id   = aws_ebs_volume.create_volume.id
}