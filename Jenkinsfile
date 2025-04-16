pipeline {
 agent any 
 options {
        ansiColor('xterm')
    }

 parameters {
       
        choice(name: 'ACTION', choices: ['apply', 'destroy'], description: 'select terraform options')

        }   
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
            sh "terraform ${params.ACTION} -var-file=dev/dev.tfvars -auto-approve"
              }
            }

        }
}
    
