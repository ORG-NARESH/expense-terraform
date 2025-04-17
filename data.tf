data "aws_ami" "main" {
 
  most_recent      = true
  owners           = ["355449129696"]
  
 filter {
    name   = "description"
    values = ["DevOps-LabImage-RHEL9"]
  }


}


# output "verifyingsecurityID" {
#   value = data.aws_security_group.main.id
# }

# # data "aws_security_group" "main" {

# #   name = var.security_group_name                       
# # }

data "aws_route53_zone" "name" {
  name         = var.domain
}

# data "aws_security_group" "main" {
#   id = data.aws_security_group.main.id
# }


# data "aws_route53_zone" "id" {
#  zone_id = data.aws_route53_zone.main.zone_id
  
# }                 


