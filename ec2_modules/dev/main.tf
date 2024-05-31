data "aws_ami" "instance"{
  most_recent = true
  owners = ["self"]
  filter  {
    name = "name"
    values = var.aws_latest_name
  }
}

module "instance_provisioning"  {
  source = "../module"
  ami    = data.aws_ami.instance.id
  instance_type = var.instance_type
  security_groups = var.security_groups
  subnet_id = var.subnet_id
  tag_name = var.tag_name
}