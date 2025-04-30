env  = "dev"
path = "expense-dev/SSH_CRED"

components = {

  mysql = {
    Name          = "mysql"
    port_no       = "3306"
    instance_type = "t3.medium"
    #port_no_of_nodeexporter = "9100"
    Monitor = "yes"

  }
  backend = {

    Name          = "backend"
    port_no       = "8080"
    instance_type = "t3.micro"
    #port_no_of_nodeexporter = "9100"
    Monitor = "yes"

  }
  frontend = {

    Name          = "frontend"
    port_no       = "80"
    instance_type = "t3.small"
    #port_no_of_nodeexporter = "9100"
    Monitor = "yes"

  }
  # node123 = {

  #   Name                    = "node123"
  #   port_no                 = "80"
  #   instance_type           = "t2.small"
  #   #port_no_of_nodeexporter = "9100"

  # }

}