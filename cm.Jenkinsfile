pipeline {
    agent any
    options {
        ansiColor('xterm')
        disableConcurrentBuilds()
        buildDiscarder(logRotator(numToKeepStr: "2"))
    }

    parameters {
        choice(name: 'ENVIRONMENT', choices: ['dev', 'prod'], description: 'Select environment options')
        choice(name: 'ACTION', choices: ['apply', 'destroy'], description: 'Select terraform options')
    }

    environment {
    
    VAULT_TOKEN = credentials('valut_token')
   }

    
stages {
        
  

  
        stage('Initiating Terraform') {
            steps {
                withCredentials([string(credentialsId: 'vault_token', variable: 'token')])
                sh "rm -rf .terraform"
                sh "terraform init -reconfigure -backend-config=${params.ENVIRONMENT}/state.tf -var token=${VAULT_TOKEN}"
            }
        }

        stage('Run Configuration Management') {
            steps {
                withCredentials([string(credentialsId: 'vault_token', variable: 'token')])
                script {
                    // Apply only the null_resource for configuration management
                    sh """
                        terraform ${params.ACTION} -target=null_resource.expenseApp \
                        -var-file=${params.ENVIRONMENT}/${params.ENVIRONMENT}.tfvars \
                        -var token=${VAULT_TOKEN}

                        -auto-approve
                    """
                }
            }
        }
    }
}
