pipeline {
    agent any

    environment {
        ANSIBLE_VAULT_PASSWORD_FILE = credentials ('VAULT_ID')
        AWS_CREDENTIALS = credentials ('AWS_ID')
        ANSIBLE_HOSTS="ansible-jobs/inventory/ec2.py"
        EC2_INI_PATH="ansible-jobs/inventory/ec2.ini"
    }

    stages {
        stage('PULL DIRECTION APP IMAGE...........') {
            steps { 
                sh 'docker pull olaniyikolawole744/dir-app-testrun:latest'
           }
        } 

        stage('CREATE DIR APP CONTAINER') {
            steps { 
                sh 'docker run --env-file $AWS_CREDENTIALS  olaniyikolawole744/dir-app-testrun:latest'
           }
        } 
    }
}