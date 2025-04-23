pipeline {
 agent any 
 options {
        
        disableConcurrentBuilds()
        buildDiscarder(logRotator(numToKeepStr: "2"))
}

 parameters {
       
        
        choice(name: 'ACTION', choices: ['apply', 'destroy'], description: 'select terraform options')
        choice(name: 'ENVIRONMENT', choices: ['dev', 'prod'], description: 'select environment options')

        }   
 stages {
    stage ('initiating terraform'){
          steps {
              sh "rm -rf .terraform"
             sh "terraform init -reconfigure -backend-config=${params.ENVIRONMENT}/state.tf"

                }
            }
    stage('Terrafom apply') {
        steps {
             sh "terraform ${params.ACTION}  -var-file=${params.ENVIRONMENT}/${params.ENVIRONMENT}.tfvars -auto-approve"
              }
            }

    // stage('Sanity check before terraform apply') {
    //         steps {
    //             input "Click on Yes to approve terraform apply"
    //         }
    //     }



        }
}
    
