# Route table for internal resources
resource "aws_route_table" "RTB_INT" {
  #vpc_id = aws_vpc.Jenkins_Project_VPC.id
  vpc_id = module.VPC.VPC_ID 

  route {
    cidr_block                = "0.0.0.0/0"
    egress_only_gateway_id    = ""
    gateway_id                = ""
    instance_id               = ""
    ipv6_cidr_block           = ""
    nat_gateway_id            = aws_nat_gateway.JP-NGW.id
    network_interface_id      = ""
    transit_gateway_id        = ""
    vpc_peering_connection_id = ""
  }

  tags = {
    Name = "RTB_INT"
  }
}

# Route table for external resources
resource "aws_route_table" "RTB_EXT" {
  #vpc_id = aws_vpc.Jenkins_Project_VPC.id
  vpc_id = module.VPC.VPC_ID 

  route {
    cidr_block                = "0.0.0.0/0"
    egress_only_gateway_id    = ""
    gateway_id                = aws_internet_gateway.JP-IGW.id
    instance_id               = ""
    ipv6_cidr_block           = ""
    nat_gateway_id            = ""
    network_interface_id      = ""
    transit_gateway_id        = ""
    vpc_peering_connection_id = ""
  }

  tags = {
    Name = "RTB_EXT"
  }
}