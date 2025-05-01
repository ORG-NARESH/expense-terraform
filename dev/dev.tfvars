env                     = "dev"
path                    = "expense-dev/SSH_CRED"
prometheus_server       = ["172.31.7.38/32"]
port_no_of_nodeexporter = "9100"


components = {

  mysql = {
    Name          = "mysql"
    port_no       = "3306"
    instance_type = "t3.medium"
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
    instance_type = "t3.small"
    Monitor       = "yes"



  }


}