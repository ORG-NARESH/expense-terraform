module "app"{
    source = "git::https://github.com/ORG-NARESH/org-modules-EC2-R53.git"
    for_each = var.components
    ami = var.ami
    vpc_security_group_ids = var.vpc_security_group_ids
    Name = each.value["Name"]
    zone_id = var.zone_id
    domain = var.domain
    instance_type = var.instance_type
    env = var.env

}

resource "null_resource" "expenseApp" {
    for_each = var.components
    connection {
    type     = "ssh"
    user     = var.user
    password = var.password
    host     = data.aws_instance.main[each.key].private_ip
  }
   provisioner "remote-exec" {
    inline = [
      "sleep 10",
      "pip3.11 install ansible -y",
      "ansible-pull -U https://github.com/ORG-NARESH/ansible_Expense_Roles.git -e env=dev -e component=${each.value["Name"]} expense-pull.yml "
    ]
  }
  
}
