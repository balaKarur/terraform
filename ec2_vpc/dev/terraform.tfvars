aws_latest_name=["kider*"]
ami="ami-01e59100ba48a7d3c"
cidr=["0.0.0.0/0"]
sgname="neptune1"
instance_type="t2.micro"
mytag="web1"
keyname="neptune"
subnet_id="subnet-0c0114228a46f2cd8"
#vpc variables
vpc_cidr="1.0.0.0/16"
vpc_instance_tenancy="default"
vpc_name="terraform_vpc"
#public subnet variables
public_subnet_cidr="1.0.0.0/26"
public_az="us-west-2a"
public_subnet_name="terraform_public_subnet"
#private subnet variables
private_subnet_cidr="1.0.1.0/26"
private_az="us-west-2b"
private_subnet_name="terraform_private_subnet"
#IG
IG_tag_name="terraform_IG"
#public route table
public_rt_tag_name="terraform_public_rt"
#Elastic IP
eip_name="terraform_eip"
#private route table
private_rt_tag_name="terraform_private_rt"
