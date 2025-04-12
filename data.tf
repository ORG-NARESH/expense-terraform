data "aws_ami" "main" {
  most_recent = true

  filter {
    name   = "Name"
    values = ["DevOps-LabImage-RHEL9"]
  }

  owners = ["703671922956"]
}