# module "app"{
#     source = "git::https://github.com/ORG-NARESH/org-modules-EC2-R53.git"
#     for_each = var.components
#     ami = data.aws_ami.main.id
#     vpc_security_group_ids = var.vpc_security_group_ids
#     Name = each.value["Name"]
#     zone_id = data.aws_route53_zone.main.zone_id
#     domain = var.domain
#     instance_type = each.value["instance_type"]
#     env = var.env
#     #port_no = each.value["port_no"]

# }

module "mysql" {
  source = "git::https://github.com/ORG-NARESH/org-modules-EC2-R53.git"
  ami = data.aws_ami.main.id
  zone_id = data.aws_route53_zone.main.zone_id
  domain = var.domain
  vpc_security_group_ids = var.vpc_security_group_ids
  Name = var.components[each.value["mysql"]]
  env = var.env
  instance_type = ""

  
}

module "backend" {
  depends_on = [ module.mysql ]
  source = "git::https://github.com/ORG-NARESH/org-modules-EC2-R53.git"
  ami = data.aws_ami.main.id
  zone_id = data.aws_route53_zone.main.zone_id
  domain = var.domain
  vpc_security_group_ids = var.vpc_security_group_ids
  Name = var.components[each.value["backend"]]
  env = var.env
  instance_type = ""
  
}

module "frontend" {
  depends_on = [ module.backend ]
  source = "git::https://github.com/ORG-NARESH/org-modules-EC2-R53.git"
  ami = data.aws_ami.main.id
  zone_id = data.aws_route53_zone.main.zone_id
  domain = var.domain
  vpc_security_group_ids = var.vpc_security_group_ids
  Name = var.components[each.value["frontend"]]
  env = var.env
  instance_type = ""
  
}



resource "null_resource" "expenseApp" {
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
