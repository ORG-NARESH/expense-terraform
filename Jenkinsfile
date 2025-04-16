pipeline {
 agent any 
 stages {
    stage ('initiating terraform'){
          steps {
             sh 'terraform init -var-file=dev/dev.tfvars'
                }
            }
    stage('Terrafom plan') {
        steps {
             sh 'terraform plan -var-file=dev/dev.tfvars'
              }
            }
    stage('Terraform apply') {
        steps {
            sh 'terraform apply -var-file=dev/dev.tfvars -auto-approve'
              }
            }

        }
}
    
