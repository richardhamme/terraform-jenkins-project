# Create the VPC for the project

variable "CIDR_BLOCK" {
  type = string
}  

variable "VPC_NAME" {
  type = string
}

# Create the VPC
resource "aws_vpc" "Jenkins_Project_VPC" {
  cidr_block = var.CIDR_BLOCK
  enable_dns_hostnames = "true"
  enable_dns_support   = "true"

  tags = {
    Name = var.VPC_NAME
  }
}

# Output the VPC so it can used elsewhere in the project
output "VPC_ID" {
  value = aws_vpc.Jenkins_Project_VPC.id
}