output "public_ip" {
  value = aws_instance.JP-Jenkins-Master-AZ1.public_ip
}

output "private_ip" {
  value = aws_instance.JP-Jenkins-Slave-AZ1.private_ip
}

