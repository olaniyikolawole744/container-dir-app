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
                sh 'ls'
           }
        } 

        stage('CREATE DIR APP CONTAINER') {
            steps { 
                sh 'git clone https://github.com/olaniyikolawole744/container-dir-app.git'
                sh 'chmod 755 ansiblescript.sh'
                sh './ansiblescript.sh'
           }
        } 
    }
}