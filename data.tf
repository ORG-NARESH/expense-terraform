data "aws_ami" "main" {
 
  most_recent      = true
  owners           = ["355449129696"]
  description = "DevOps-LabImage-RHEL9"


}




# data "aws_ami" "main" {
#   most_recent = true

#   filter {
#     name   = "Name"
#     values = ["DevOps-LabImage-RHEL9"]
#   }

#   owners = ["703671922956"]
# }


# output "verifyingDns" {
#   value = data.aws_security_group.main.id
# }

# data "aws_security_group"  "main" {
#     id =  data.aws_security_group.main.id
# }

data "aws_route53_zone" "main1" {
  name         = "eternallearnings.shop"

}

# data "aws_route53_zone" "main1" {
#  zone_id = data.aws_route53_record.main.zone_id
# } 
# data "aws_route53_zone" "main" {
#  zone_id = data.aws_route53_zone.main.zone_id
  
# }

