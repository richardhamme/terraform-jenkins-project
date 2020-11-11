# Create an Elastic IP
resource "aws_eip" "NGW-EIP" {
  vpc = true
}

# Create a Nat Gateway associate to Elastic IP
resource "aws_nat_gateway" "JP-NGW" {
  allocation_id = aws_eip.NGW-EIP.id
  subnet_id     = aws_subnet.JP-EXT-AZ1.id
  tags = {
    Name = "TF-NGW"
  }
}