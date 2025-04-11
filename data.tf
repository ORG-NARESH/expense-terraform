data "aws_instance" "main" {
    private_ip = data.aws_instance.main.private_ip
}