data "aws_instance" "main" {
    for_each = var.components
    filter {
    name   = "tag:Name"
    values = [var.components[each.value["Name"]]]
  }
}

# output "instance" {
#     value = data.aws_instance.main.private_ip
# }