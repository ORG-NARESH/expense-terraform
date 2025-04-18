variable "user" {
  default = "ec2-user"
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
        Name = "mysql"
        port_no = "3306"
        instance_type = "t3.micro"
        
    }
    backend = {
       
        Name = "backend"
        port_no = "8080"
        instance_type = "t2.micro"
        
    }
    frontend = {
        
        Name = "frontend"
        port_no = "80"
        instance_type = "t2.small"
        
    }
  
}
}

