data "aws_instance" "main" {
  
  filter {
    name   = "tag:Name"
    values = var.components[each.value["Name"]]
  }
}