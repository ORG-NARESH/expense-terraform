# resource "null_resource" "expenseApp" {
#     depends_on = [module.mysql, module.backend, module.frontend]
#     for_each = var.components
#     connection {
#     type     = "ssh"
#     user     = var.user
#     password = var.password
#     host     = "${each.value["Name"]}-${var.env}.${var.domain}"
#     }
  
#    provisioner "remote-exec" {
#     inline = [
#       "sleep 10",
#       "ansible-pull -U https://github.com/ORG-NARESH/ansible_Expense_Roles.git -e env=${var.env} -e component=${each.value["Name"]} Roles/expense-pull.yml"
#     ]
#   }
  
# }