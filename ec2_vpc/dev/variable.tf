variable "ami" {}
variable "cidr" {}
variable "sgname" {}
variable "instance_type" {}
variable "mytag" {}
variable "keyname" {}
variable "subnet_id" {}
variable "aws_latest_name" {}
#vpc variables
variable "vpc_cidr" {}
variable "vpc_instance_tenancy" {}
variable "vpc_name" {}
#public subnet variables
variable "public_subnet_cidr" {}
variable "public_az" {}
variable "public_subnet_name" {}
#private subnet variables
variable "private_subnet_cidr" {}
variable "private_az" {}
variable "private_subnet_name" {}
#IG
variable "IG_tag_name" {}
#public route table
variable "public_rt_tag_name" {}
#Elastic IP
variable "eip_name" {}
#private route table
variable "private_rt_tag_name" {}