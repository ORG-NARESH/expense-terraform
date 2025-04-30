data "aws_ami" "main" {

  most_recent = true
  owners      = ["355449129696"]

  filter {
    name   = "description"
    values = ["DevOps-LabImage-RHEL9*"]
  }


}


data "aws_route53_zone" "main" {
  name = var.domain
}

data "vault_generic_secret" "main" {
  path = var.path


}



# output "ssh" {
#   value = data.vault_generic_secret.main.data["SSH_USER"]
# }