data "aws_caller_identity" "current" {}

#Add Access key here
variable "JP_ACCESS_KEY" {
  type    = string
  default = ""
}

#Add Secret key here
variable "JP_SECRET_KEY" {
  type    = string
  default = ""
}

#Userdata for Jenkins Master
data "template_file" "InstallJenkinsMaster" {
  template = file("InstallJenkinsMaster.sh")
}

#Userdata for Jenkins Slave
data "template_file" "InstallJenkinsSlave" {
  template = file("InstallJenkinsSlave.sh")
}

#Variables for the AWS CLI
variable "AWS-REGION" {
  type    = string
  default = "eu-west-2"
}

variable "awsprofile-jp" {
  type    = string
  default = "JP_PROFILE"
}

#EC2 Key Pair name
variable "JP-KEY-PAIR" {
  type    = string
  default = "JP-KEY-PAIR"
}
