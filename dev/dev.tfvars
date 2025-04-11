env = "dev"
variable "components" {

 default = {
    mysql = {
        Name = "mysql"
    }
    backend = {
        Name = "backend"
    }
    frontend = {
        Name = "frontend"
    }
  
}
}