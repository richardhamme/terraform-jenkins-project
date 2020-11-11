# JenkinsProject
Jenkins Project / Author : Richard Hamme

This project provisions a multi-node Jenkins cluster using Docker. 

Provisioning Instructions

1) Download or clone the Github reposity to a local folder

2) Download the Terraform executable from Hashicorp and copy to the local folder with the downloaded scripts.
https://www.terraform.io/downloads.html

3) Install the AWS CLI if not already present on the local machine. The Terraform scripts call this to create and download the EC2 Key Pair.
https://aws.amazon.com/cli/

4) If not already present in the AWS account create an account with programmatic access, and note the access and secret keys. The account will need the AdministratorAccess policy to be attached.

5) Open "Variables_Jenkins_Project.tf" in an editor and edit the following sections, replacing the contents of default with access key and secret for your AWS account.

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

6) Open a Command Prompt and navigate to the folder where the code is downloaded.

7) Run ".\terraform init" to initialise the local directory and download the required provisioners.

8) Run ".\terrafrom apply" to provision the solution.

The Terraform script will output the public IP address for the master, and the private IP address for the slave machine to the console. The private IP address can be used to tunnel through the master to access the private machine. This is easily achieved in MobaXterm.

In a browser navigate to http://"public-address":8080

Open a terminal session to the Jenkins master (JP-Jenkins-Master-AZ1 in the AWS console) and run the following command to get the admin user password for the Jenkins console,

sudo cat /var/lib/jenkins/secrets/initialAdminPassword

The installation can be validated by creating a build job in Jenkins. The build will be performed in Docker on the slave instance.


