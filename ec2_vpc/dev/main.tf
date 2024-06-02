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
  vpc_cidr=var.vpc_cidr
  vpc_instance_tenancy=var.vpc_instance_tenancy
  vpc_name=var.vpc_name
  public_subnet_cidr=var.public_subnet_cidr
  public_az=var.public_az
  public_subnet_name=var.public_subnet_name
  #private subnet variables
  private_subnet_cidr=var.private_subnet_cidr
  private_az=var.private_az
  private_subnet_name=var.private_subnet_name
  IG_tag_name=var.IG_tag_name
  public_rt_tag_name=var.public_rt_tag_name
  eip_name=var.eip_name
  private_rt_tag_name=var.private_rt_tag_name
}