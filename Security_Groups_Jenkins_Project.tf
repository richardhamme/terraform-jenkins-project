# Security Group for Jenkins Master
resource "aws_security_group" "SG-JP-EXT" {
  name        = "SG-JP-EXT"
  description = "Security Group - SG-JP-EXT"
  vpc_id = module.VPC.VPC_ID 

  tags = {
    Name = "SG-JP-EXT"
  }

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    description = "Allow port 8080"
    cidr_blocks = ["0.0.0.0/0"]
  }


  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow port 22"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Security Group for Jenkins Slave
resource "aws_security_group" "SG-JP-INT" {
  name        = "SG-JP-INT"
  description = "Security Group - SG-JP-INT"
  vpc_id = module.VPC.VPC_ID 

  tags = {
    Name = "SG-JP-INT"
  }

  ingress {
    from_port       = 3375
    to_port         = 3375
    protocol        = "tcp"
    description     = "Allow port 3375 for Docker"
    security_groups = [ aws_security_group.SG-JP-EXT.id ]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow port 22"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}