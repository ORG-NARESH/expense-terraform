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
 environment {
    
     vault_token = credentials('vault_token')
   } 

 stages {
    stage ('initiating terraform'){
          steps {
              sh "rm -rf .terraform"
             sh "terraform init -reconfigure -backend-config=${params.ENVIRONMENT}/state.tf -var token=${vault_token}"
             
                }
            }
    stage('Terrafom apply') {
        steps {
             sh "terraform ${params.ACTION} -target=module.mysql -target=module.backend -target=module.frontend  -var-file=${params.ENVIRONMENT}/${params.ENVIRONMENT}.tfvars -auto-approve -var token=${vault_token}"
                           }
            }

    // stage('Sanity check before terraform apply') {
    //         steps {
    //             input "Click on Yes to approve terraform apply"
    //         }
    //     }



        }
}
    
