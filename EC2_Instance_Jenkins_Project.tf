# Get the most recent Linux 2 Image details
data "aws_ami" "JP-AMI" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["amazon"]
}

# AZ1 Jenkins Master
resource "aws_instance" "JP-Jenkins-Master-AZ1" {
  ami = data.aws_ami.JP-AMI.id
  instance_type               = "t2.micro"
  key_name                    = "JP-KEY-PAIR"
  associate_public_ip_address = "true"
  vpc_security_group_ids      = [ aws_security_group.SG-JP-EXT.id ]
  #vpc_security_group_ids = var.Security_Group
  subnet_id                   = aws_subnet.JP-EXT-AZ1.id
  user_data                   = data.template_file.InstallJenkinsMaster.rendered

  root_block_device {
    delete_on_termination = "true"
    volume_size           = "40"
    volume_type           = "gp2"
  }

  # Tag any volumes associated with the instance 
  volume_tags = {
    Name = "JP-Jenkins-Master-AZ1"
  }
  # Tag the instance
  tags = {
    Name = "JP-Jenkins-Master-AZ1"
  }

  depends_on = [null_resource.CREATE_KEY_PAIR]
}

# AZ1 Jenkins Slaves
resource "aws_instance" "JP-Jenkins-Slave-AZ1" {
  ami = data.aws_ami.JP-AMI.id
  instance_type          = "t2.micro"
  key_name               = "JP-KEY-PAIR"
  vpc_security_group_ids = [ aws_security_group.SG-JP-INT.id ]
  subnet_id              = aws_subnet.JP-INT-AZ1.id
  user_data              = data.template_file.InstallJenkinsSlave.rendered

  root_block_device {
    delete_on_termination = "true"
    volume_size           = "40"
    volume_type           = "gp2"
  }
  # Tag any volumes associated with the instance 
  volume_tags = {
    Name = "JP-Jenkins-Slave-AZ1"
  }
  # Tag the instance
  tags = {
    Name = "JP-Jenkins-Slave-AZ1"
  }

  depends_on = [null_resource.CREATE_KEY_PAIR]
}