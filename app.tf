resource "null_resource" "expenseApp" {
  depends_on = [module.mysql, module.backend, module.frontend]
  for_each   = var.components
  connection {
    type     = "ssh"
    user     = data.vault_generic_secret.main.data["SSH_USER"]
    password = data.vault_generic_secret.main.data["SSH_PASS"]
    host     = "${each.value["Name"]}-${var.env}.${var.domain}"
  }

  provisioner "remote-exec" {
    inline = [
      "sleep 10",
      "sudo /usr/bin/python3.11 -m pip install ansible",
      "ansible-pull -U https://github.com/ORG-NARESH/ansible_Expense_Roles.git -e env=${var.env} -e component=${each.value["Name"]} -e token=${var.token} -e ansible_python_interpreter=/usr/bin/python3.11 Roles/expense-pull.yml"
    ]
  }

}