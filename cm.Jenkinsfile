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
    VAULT_SKIP_VERIFY = 'true'
}

stages {
        stage('Verify Vault Connectivity') {
            steps {
                sh "curl -k https://vault.eternallearnings.shop:8200/v1/expense-dev/mysql"
               
            }
        }
  

  
        stage('Initiating Terraform') {
            steps {
                sh "rm -rf .terraform"
                sh "terraform init -reconfigure -backend-config=${params.ENVIRONMENT}/state.tf"
            }
        }

        stage('Run Configuration Management') {
            steps {
                script {
                    // Apply only the null_resource for configuration management
                    sh """
                        terraform ${params.ACTION} -target=null_resource.expenseApp \
                        -var-file=${params.ENVIRONMENT}/${params.ENVIRONMENT}.tfvars \
                        -auto-approve
                    """
                }
            }
        }
    }
}
