# data "aws_ami" "main" {

#   most_recent = true
#   owners      = ["703671922956"]

#   filter {
#     name   = "name"
#     values = ["DevOps-LabImage-RHEL9*"]
#   }


# }


data "aws_route53_zone" "main" {
  name = var.domain
}



