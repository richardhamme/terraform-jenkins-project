#
# Configure the AWS CLI, access_key, secret_key and default region
#

resource "null_resource" "JP_aws_access_key" {
  provisioner "local-exec" {
    command = "aws configure set aws_access_key_id ${var.JP_ACCESS_KEY} --profile ${var.awsprofile-jp} --region ${var.AWS-REGION}"
  }
}

resource "null_resource" "JP_aws_secret_access_key" {
  provisioner "local-exec" {
    command = "aws configure set aws_secret_access_key ${var.JP_SECRET_KEY} --profile ${var.awsprofile-jp} --region ${var.AWS-REGION}"
  }
}

resource "null_resource" "JP_default_region_name" {
  provisioner "local-exec" {
    command = "aws configure set default_region_name ${var.AWS-REGION} --profile ${var.awsprofile-jp} --region ${var.AWS-REGION}"
  }
}

