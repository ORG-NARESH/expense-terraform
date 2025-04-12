data "aws_instance" "main" {
    private_ip = data.aws_instance.main.private_ip
}

output "private_ip" {
    value = data.aws_instance.main.private_ip
}