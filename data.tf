data "aws_ami" "main" {
  most_recent = true

  filter {
    name   = "name"
    values = [DevOps-LabImage-RHEL9]
  }

  owners = ["703671922956"]
}