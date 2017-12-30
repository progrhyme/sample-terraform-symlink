# Global Variables
variable "project_name" {}
variable "aws_region"   {}
variable "availability_zones" { type = "list" }
variable "ec2_ssh_key_name" {}

# Variables for each environment
variable "aws_profile"      {}
variable "environment_name" {}
variable "trusted_cidr_blocks" { type = "list" }
