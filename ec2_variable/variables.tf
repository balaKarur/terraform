variable "ami" {}
variable "instance_type" {
  default = "t2.micro"
}
variable "key_name" {
  default = "neptune"
}
variable "security_groups" {
  default = ["sg-063b0f05b58823bba"]
}
variable "subnet_id" {
  default = "subnet-0c0114228a46f2cd8"
}
variable "tag_name" {
  default = "web1"
}