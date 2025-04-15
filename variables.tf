variable "user" {
  default = "ec2-user"
}

variable "password" {
  default = "DevOps321"
}

variable "domain" {
    default = "eternallearnings.shop"
}

variable "vpc_security_group_ids" {
     type        = list(string)
    default = ["sg-02efeff1df99019a6"]
}

variable "env" {}

variable "components" {

 default = {
    mysql = {
        Name = "mysql"
        #port_no = "3306"
        instance_type = "t3.micro"
        vpc_security_group_ids = ["sg-02efeff1df99019a6"]
    }
    backend = {
       
        Name = "backend"
        #port_no = "8080"
        instance_type = "t2.micro"
        vpc_security_group_ids = ["sg-02efeff1df99019a6"]
    }
    frontend = {
        
        Name = "frontend"
        #port_no = "80"
        instance_type = "t2.small"
        vpc_security_group_ids = ["sg-02efeff1df99019a6"]
    }
  
}
}

