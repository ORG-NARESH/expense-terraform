data "aws_ami" "main" {
 
  most_recent      = true
  owners           = ["355449129696"]
  
 filter {
    name   = "description"
    values = ["DevOps-LabImage-RHEL9"]
  }


}


# output "verifyingDns" {
#   value = data.aws_security_group.main.id
# }

data "aws_security_group" "main" {
    
  name = ["B59-Terraform-SG"]                             
}

data "aws_route53_zone" "main" {
  name         = var.domain
}

# data "aws_route53_zone" "main1" {
#  zone_id = data.aws_route53_record.main.zone_id
# } 
# data "aws_route53_zone" "main" {
#  zone_id = data.aws_route53_zone.main.zone_id
  
# }

