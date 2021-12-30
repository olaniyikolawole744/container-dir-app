pipeline {
    agent any

    environment {
        ANSIBLE_VAULT_PASSWORD_FILE = credentials ('VAULT_ID')
        AWS_CREDENTIALS = credentials ('AWS_ID')
        ANSIBLE_HOSTS="ansible-jobs/inventory/ec2.py"
        EC2_INI_PATH="ansible-jobs/inventory/ec2.ini"
    }

    stages {
        stage('LIST OUT FILES.....') {
            steps { 
                 sh 'ls'
           }
        } 

        stage('BUILD IMAGE') {
            steps { 
                sh 'docker build -t dir-app .'
           }
        } 

        stage('CREATE CONTAINER') {
            steps { 
                sh 'docker run  --env-file $AWS_CREDENTIALS  dir-app'
           }
        } 
    }
}