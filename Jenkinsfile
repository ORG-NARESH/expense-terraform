pipeline {
 agent any 
 options {
        ansiColor('xterm')
        disableConcurrentBuilds()
        buildDiscarder(logRotator(numToKeepStr: "2"))
}

 parameters {
       
        choice(name: 'ACTION', choices: ['plan', 'destroy'], description: 'select terraform options')
        string(name: 'OPTION', defaultValue: 'apply', description: 'this will apply')
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
             sh "terraform ${params.ACTION}  -var-file=${params.ENVIRONMENT}/${params.ENVIRONMENT}.tfvars"
              }
            }

    // stage('Sanity check before terraform apply') {
    //         steps {
    //             input "Click on Yes to approve terraform apply"
    //         }
    //     }

    stage('Terraform apply') {
        steps {
            sh "terraform ${params.OPTION} -var-file=${params.ENVIRONMENT}/${params.ENVIRONMENT}.tfvars -auto-approve"
              }
            }

        }
}
    
