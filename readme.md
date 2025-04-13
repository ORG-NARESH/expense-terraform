This repo is to create expense app using terraform code and running via jenkins pipelines

terraform init -reconfigure  -backend-config=dev/state.tf ; terraform plan -var-file=dev/dev.tfvars
terraform apply  -var-file=dev/dev.tfvars -auto-approve

terraform init -reconfigure  -backend-config=prod/state.tf
terraform apply  -var-file=prod/prod.tfvars


To destroy DEV environement now

terraform init -reconfigure  -backend-config=dev/state.tf
terraform destroy  -var-file=dev/dev.tfvars

To destroy PROD environement now

terraform init -reconfigure  -backend-config=prod/state.tf
terraform destroy  -var-file=prod/prod.tfvars