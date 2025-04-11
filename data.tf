data "aws_instance" "main" {
    
}

output "instance" {
    value = data.aws_instance.main.private_ip
}