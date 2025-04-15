module "mysql" {
  source = "git::https://github.com/ORG-NARESH/org-modules-EC2-R53.git"
  ami = data.aws_ami.main.id
  zone_id = data.aws_route53_zone.main.zone_id
  domain = var.domain
  vpc_security_group_ids  = var.components["mysql"].vpc_security_group_ids
  Name = "mysql"
  env = var.env
  instance_type = ""

  
}

module "backend" {
  depends_on = [ module.mysql ]
  source = "git::https://github.com/ORG-NARESH/org-modules-EC2-R53.git"
  ami = data.aws_ami.main.id
  zone_id = data.aws_route53_zone.main.zone_id
  domain = var.domain
  vpc_security_group_ids = var.components["backend"].vpc_security_group_ids
  Name = "backend"
  env = var.env
  instance_type = ""
  
}

module "frontend" {
  depends_on = [ module.backend ]
  source = "git::https://github.com/ORG-NARESH/org-modules-EC2-R53.git"
  ami = data.aws_ami.main.id
  zone_id = data.aws_route53_zone.main.zone_id
  domain = var.domain
  vpc_security_group_ids = var.components["frontend"].vpc_security_group_ids
  Name = "frontend"
  env = var.env
  instance_type = ""
  
}



resource "null_resource" "expenseApp" {
    depends_on = [module.mysql, module.backend, module.frontend]
    for_each = var.components
    connection {
    type     = "ssh"
    user     = var.user
    password = var.password
    host     = "${each.value["Name"]}-${var.env}.${var.domain}"
    }
  
   provisioner "remote-exec" {
    inline = [
      "sleep 10",
      "pip3.11 install ansible",
      "ansible-pull -U https://github.com/ORG-NARESH/ansible_Expense_Roles.git -e env=${var.env} -e component=${each.value["Name"]} Roles/expense-pull.yml"
    ]
  }
  
}
