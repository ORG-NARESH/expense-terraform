env  = "prod"
path = "expense-prod/SSH_CRED"

components = {

  mysql = {
    Name          = "mysql"
    port_no       = "3306"
    instance_type = "m1.small"
    Monitor       = "yes"

  }
  backend = {

    Name          = "backend"
    port_no       = "8080"
    instance_type = "t3.micro"
    Monitor       = "yes"

  }
  frontend = {

    Name          = "frontend"
    port_no       = "80"
    instance_type = "t2.small"
    Monitor       = "yes"

  }

}
