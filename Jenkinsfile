pipeline {
    agent any

    environment {
        ANSIBLE_VAULT_PASSWORD_FILE = credentials ('DOCKERHUBKEY')
        ANSIBLE_HOSTS="ansible-jobs/inventory/ec2.py"
        EC2_INI_PATH="ansible-jobs/inventory/ec2.ini"
    }

    stages {
        
        stage('BUILD INFRASTRUCTURE') {
            steps { 
                 sh 'sh scripts/infrastructure.sh'
           }
        } 

        stage('PLAY ANSIBLE BOOK') {
             when {
                branch "develop"
            }
            steps {
                sh 'sh playdev.sh'      
                }
        }  

        stage('PLAY ANSIBLE BOOK') {
             when {
                branch "main"
            }
            steps {
                sh 'sh playprod.sh'      
            }
        } 
    }
}