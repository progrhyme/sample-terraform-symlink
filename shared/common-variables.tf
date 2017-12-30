# Global Variables
variable "project_name" {}
variable "aws_region"   {}
variable "availability_zones" { type = "list" }

# Variables for each environment
variable "aws_profile"      {}
variable "environment_name" {}
