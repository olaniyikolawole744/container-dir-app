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

        stage('CREATE DEV APP') {
             when {
                branch "develop"
            }
            steps {
                sh 'sh playdev.sh'      
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

        stage('CREATE PROD APP 2') {
             when {
                branch "main"
            }
            steps {
                sh 'sh cd ansible-jobs'
                sh 'ls'   
                sh 'sh ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook playbook/playprod.yml -i inventory/hosts/ec2.py -vvvvv'   
            }
        } 
    }
}





