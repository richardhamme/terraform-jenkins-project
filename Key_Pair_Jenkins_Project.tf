
#Remove key pair if already created
resource "null_resource" "DELETE_KEY_PAIR" {
  provisioner "local-exec" {
    command = "aws ec2 delete-key-pair --key-name ${var.JP-KEY-PAIR} --region ${var.AWS-REGION} --profile ${var.awsprofile-jp}"
  }
}

#Create key pair for EC2
resource "null_resource" "CREATE_KEY_PAIR" {
  depends_on = [
    null_resource.DELETE_KEY_PAIR,
  ]
  provisioner "local-exec" {
    command = "aws ec2 create-key-pair --key-name ${var.JP-KEY-PAIR} --output text > ${var.JP-KEY-PAIR}.pem --region ${var.AWS-REGION} --profile ${var.awsprofile-jp}"
  }
}

