# Used to tag resources
variable "env" {}

# AWS config
variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "aws_region"      { default = "eu-west-2" }
variable "aws_subregion_a" { default = "eu-west-2a" }

# Key name and file for SSH access
variable "key_name"      {}
variable "key_pair_file" {}

# EC2 instances
## Linux/Unix, Ubuntu 18.04 - Bionic - 64-bit Amazon Machine Image (AMI)
variable "instance_ami"  { default = "ami-cc6d8eab" }
variable "instance_type" { default = "t2.micro" }

# prevent storage of blockchain data from being destroyed
variable "ethereum_data_prevent_destroy" { default = "false" }
