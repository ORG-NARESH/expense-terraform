module "app"{
    source = "git::https://github.com/ORG-NARESH/org-modules-EC2-R53.git"
    for_each = var.components
    ami = data.aws_ami.main.id
    vpc_security_group_ids = var.vpc_security_group_ids
    Name = each.value["Name"]
    zone_id = "Z0135212GWRZC8NQ42PM"
    domain = var.domain
    instance_type = each.value["instance_type"]
    env = var.env
    #port_no = each.value["port_no"]

}

resource "null_resource" "expenseApp" {
  depends_on = [ module.app ]
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
      "ansible-pull -U https://github.com/ORG-NARESH/ansible_Expense_Roles.git -e env=dev -e component=${each.value["Name"]} Roles/expense-pull.yml"
    ]
  }
  
}
