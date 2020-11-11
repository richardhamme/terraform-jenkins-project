# Create Subnet for Jenkins Master
resource "aws_subnet" "JP-EXT-AZ1" {
  #vpc_id            = aws_vpc.Jenkins_Project_VPC.id
  vpc_id = module.VPC.VPC_ID 
  cidr_block        = "10.0.1.0/24"
  availability_zone = "eu-west-2a"

  tags = {
    Name = "JP-EXT-AZ1"
  }
}

# Create Subnet for Jenkins Slave
resource "aws_subnet" "JP-INT-AZ1" {
  #vpc_id            = aws_vpc.Jenkins_Project_VPC.id
  vpc_id = module.VPC.VPC_ID 
  cidr_block        = "10.0.2.0/24"
  availability_zone = "eu-west-2a"

  tags = {
    Name = "JP-INT-AZ1"
  }
}

# Internal Route Table association
resource "aws_route_table_association" "JP-INT-AZ1" {
  subnet_id      = aws_subnet.JP-INT-AZ1.id
  route_table_id = aws_route_table.RTB_INT.id
}

# Associate with route table to give route to the Internet
resource "aws_route_table_association" "JP-EXT-AZ1" {
  subnet_id      = aws_subnet.JP-EXT-AZ1.id
  route_table_id = aws_route_table.RTB_EXT.id
}
