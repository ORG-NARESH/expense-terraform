env = "dev"

components = {

  mysql = {
    Name          = "mysql"
    port_no       = "3306"
    instance_type = "t3.medium"

  }
  backend = {

    Name          = "backend"
    port_no       = "8080"
    instance_type = "t3.micro"

  }
  frontend = {

    Name          = "frontend"
    port_no       = "80"
    instance_type = "t3.small"

  }

}