pipeline {
 agent any 
 options {
        ansiColor('xterm')
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
             sh "terraform ${params.ACTION} -target=module.mysql  -var-file=${params.ENVIRONMENT}/${params.ENVIRONMENT}.tfvars -auto-approve"
             sh "terraform ${params.ACTION} -target=module.backend  -var-file=${params.ENVIRONMENT}/${params.ENVIRONMENT}.tfvars -auto-approve"
             sh "terraform ${params.ACTION} -target=module.frontend  -var-file=${params.ENVIRONMENT}/${params.ENVIRONMENT}.tfvars -auto-approve" 
              }
            }

    // stage('Sanity check before terraform apply') {
    //         steps {
    //             input "Click on Yes to approve terraform apply"
    //         }
    //     }



        }
}
    
