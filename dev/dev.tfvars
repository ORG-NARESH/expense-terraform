env = "dev"

components = {

    mysql = {
        Name = "mysql"
        #port_no = "3306"
        instance_type = "t3.medium"
        vpc_security_group_ids = ["sg-02efeff1df99019a6"]
    }
    backend = {
       
        Name = "backend"
        #port_no = "8080"
        instance_type = "t3.micro"
        vpc_security_group_ids = ["sg-02efeff1df99019a6"]
    }
    frontend = {
        
        Name = "frontend"
        #port_no = "80"
        instance_type = "t3.small"
        vpc_security_group_ids = ["sg-02efeff1df99019a6"]
    }
  
}