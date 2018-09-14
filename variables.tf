variable "env" {}

variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "aws_region"     { default = "eu-west-2" }

variable "key_name"      {}
variable "key_pair_file" {}

# ec2 instance
## Linux/Unix, Ubuntu 18.04 - Bionic - 64-bit Amazon Machine Image (AMI)
variable "instance_ami"  { default = "ami-cc6d8eab" }
variable "instance_type" { default = "t2.micro" }