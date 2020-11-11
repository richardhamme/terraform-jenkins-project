# Create a private hosted zone
#
# This enables the Jenkins Master to see the Jenkins Slave
#
resource "aws_route53_zone" "private" {
  name = "internaljp.com"

  vpc {
    vpc_id = aws_vpc.Jenkins_Project_VPC.id
  }
}

#Add a record for the Jenkins slave host
resource "aws_route53_record" "slave" {
  zone_id = aws_route53_zone.private.zone_id
  name    = "jenkinslave.internaljp.com"
  type    = "A"
  ttl     = "300"
  records = [aws_instance.JP-Jenkins-Slave-AZ1.private_ip]
}
