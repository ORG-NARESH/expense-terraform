data "aws_ami" "main" {
  most_recent = true

  filter {
    name   = "Name"
    values = ["DevOps-LabImage-RHEL9"]
  }

  owners = ["703671922956"]
}


output "verifyingDns" {
  value = data.aws_security_group.main.id
}

data "aws_security_group"  "main" {
    id =  data.aws_security_group.main.id
}

data "aws_route53_zone" "main" {
  name         = var.domain
  
}