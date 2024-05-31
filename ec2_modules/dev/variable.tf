variable "ami" {}
variable "aws_latest_name" {}
variable "instance_type" {}
variable "security_groups" {}
variable "subnet_id" {}
variable "tag_name" {
  sensitive = true
}

