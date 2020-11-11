# Specify the required version
terraform {
  required_version = "> 0.12.0"
}

# Config for Jenkins Project access
provider "aws" {
  region     = var.AWS-REGION
  access_key = var.JP_ACCESS_KEY
  secret_key = var.JP_SECRET_KEY
}

#
# Putting a module here to show how modules are used
#
module "VPC" {
  source = "./modules/vpc"

  VPC_NAME = "Jenkins_Project_VPC"
  CIDR_BLOCK = "10.0.0.0/24"
 
}
