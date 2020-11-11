# Add an Internet Gateway to the VPC
resource "aws_internet_gateway" "JP-IGW" {
  vpc_id = module.VPC.VPC_ID 
 
  tags = {
    Name = "Jenkins_Project-IGW"
  }
}