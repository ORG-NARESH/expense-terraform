pipeline {
    agent any
    options {
        
        disableConcurrentBuilds()
        buildDiscarder(logRotator(numToKeepStr: "2"))
    }

    parameters {
        choice(name: 'ENVIRONMENT', choices: ['dev', 'prod'], description: 'Select environment options')
    }

    stages {
        stage('Initiating Terraform') {
            steps {
                sh "terraform init -reconfigure -backend-config=${params.ENVIRONMENT}/state.tf"
            }
        }

        stage('Run Configuration Management') {
            steps {
                script {
                    // Apply only the null_resource for configuration management
                    sh """
                        terraform apply -target=null_resource.expenseApp \
                        -var-file=${params.ENVIRONMENT}/${params.ENVIRONMENT}.tfvars \
                        -auto-approve
                    """
                }
            }
        }
    }
}