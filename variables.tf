variable "user" {
  default = "ec2-user"
}
variable "token" {

}

variable "password" {
  default = "DevOps321"
}

variable "domain" {
  default = "eternallearnings.shop"
}



variable "env" {}

variable "components" {

  default = {
    mysql = {
      Name          = "mysql"
      port_no       = "3306"
      instance_type = "t3.micro"
      #port_no_of_nodeexporter = "9100"

    }
    backend = {

      Name          = "backend"
      port_no       = "8080"
      instance_type = "t2.micro"
      #port_no_of_nodeexporter = "9100"

    }
    frontend = {

      Name          = "frontend"
      port_no       = "80"
      instance_type = "t2.small"
      #port_no_of_nodeexporter = "9100"

    }
    node123 = {

      Name          = "node123"
      port_no       = "80"
      instance_type = "t2.small"
      #port_no_of_nodeexporter = "9100"

    }

  }
}

