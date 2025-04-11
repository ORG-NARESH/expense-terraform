data "aws_instance" "main" {
    instance_id = data.aws_instance.main.instance_id
}

output "instance" {
    value = data.aws_instance.main.private_ip
}