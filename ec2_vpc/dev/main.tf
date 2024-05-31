data "aws_ami" "instance" {
  owners = ["self"]
  most_recent = true
  filter {
    name   = "name"
    values = var.aws_latest_name
  }
}

module "instance_provisioning" {
  source = "../module"
  ami=data.aws_ami.instance.id
  cidr=var.cidr
  sgname=var.sgname
  instance_type=var.instance_type
  mytag=var.mytag
  keyname=var.keyname
  subnet_id=var.subnet_id
}