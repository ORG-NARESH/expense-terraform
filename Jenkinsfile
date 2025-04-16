pipeline {
 agent any 
 options {
        ansiColor('xterm')
        disableConcurrentBuilds()
        timeout(time: 500, unit: 'SECONDS')



    }

 parameters {
       
        choice(name: 'ACTION', choices: ['apply', 'destroy'], description: 'select terraform options')
        choice(name: 'ENVIRONMENT', choices: ['dev', 'prod'], description: 'select environment options')

        }   
 stages {
    stage ('initiating terraform'){
          steps {
             sh "terraform init -reconfigure -backend-config=${params.ENVIRONMENT}/state.tf"

                }
            }
    stage('Terrafom plan') {
        steps {
             sh "terraform plan -var-file=${params.ENVIRONMENT}/${params.ENVIRONMENT}.tfvars"
              }
            }
    stage('Terraform apply') {
        steps {
            sh "terraform ${params.ACTION} -var-file=${params.ENVIRONMENT}/${params.ENVIRONMENT}.tfvars -auto-approve"
              }
            }

        }
}
    
