data "aws_instance" "main" {
    filter {
    name   = "tag:Name"
    values = [each.value["Name"]] 
  }
}

output "instance" {
    value = data.aws_instance.main.private_ip
}