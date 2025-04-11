module "app"{
    source = "git::https://github.com/ORG-NARESH/org-modules-EC2-R53.git"
    for_each = var.components
    ami = var.ami
    vpc_security_group_ids = var.vpc_security_group_ids
    Name = each.value["Name"]
    zone_id = var.zone_id
    domain = var.domain
    instance_type = var.instance_type

}
# module "mysql"{
#     source = "git::https://github.com/ORG-NARESH/org-modules-EC2-R53.git"
#     ami = var.ami
#     vpc_security_group_ids = var.vpc_security_group_ids
#     Name = "mysql"
#     zone_id = var.zone_id
#     domain = var.domain
#     instance_type = var.instance_type

# }
# module "backend"{
#     source = "git::https://github.com/ORG-NARESH/org-modules-EC2-R53.git"
#     ami = var.ami
#     vpc_security_group_ids = var.vpc_security_group_ids
#     Name = "backend"
#     zone_id = var.zone_id
#     domain = var.domain
#     instance_type = var.instance_type
# }
# resource "null_resource" "expenseApp" {
#     provisioner "local-exec" {
#     command = "sleep 10; cd /home/ec2-user/ansible_Expense_Roles ; ansible-playbook -i inv-${var.env} -e ansible_username=ec2-user -e ansible_password=DevOps321 -e env=dev -e component=${var.Name} expense.yml"
    
#     }
  
# }