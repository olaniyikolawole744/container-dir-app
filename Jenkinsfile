pipeline {
    agent any

    environment {
        ANSIBLE_VAULT_PASSWORD_FILE = credentials ('VAULT_ID')
        ANSIBLE_HOSTS="ansible-jobs/inventory/ec2.py"
        EC2_INI_PATH="ansible-jobs/inventory/ec2.ini"
    }

    stages {
        
        stage('BUILD INFRASTRUCTURE') {
            steps { 
                 sh 'sh scripts/create_infrastructure.sh'
           }
        } 

        stage('CREATE DEV APP') {
             when {
                branch "develop"
            }
            steps {
                sh 'sh scripts/playbook.sh'      
                }
        }  

        stage('CREATE PROD APP') {
             when {
                branch "main"
            }
            steps {
                sh 'sh scripts/playbook.sh'      
            }
        }   
    }
}





