pipeline {
    agent any
    stages {
        stage('Clone Repository') {
            steps {
                git 'https://github.com/Yokendrakumar1999/Task_DevOps.git'
            }
        }
        stage('Install Dependencies') {
            steps {
                sh 'apt update && apt install -y apache2 php libapache2-mod-php php-mysql mysql-client-core-8.0'
            }
        }
        stage('Deploy to /var/www/html') {
            steps {
                sh 'cp -r * /var/www/html/'
            }
        }
        stage('Delete Containers') {
            steps {
                sh 'docker rm $(docker ps -aq) || true'
            }
        }
        stage('Delete Images') {
            steps {
                sh 'docker rmi $(docker images -aq) || true'
            }
        }
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t devops:v1 .'
            }
        }
        stage('Create Docker Containers') {
            steps {
                sh 'docker run -d --name devops -p 80:80 devops:v1'
            }
        }
    }
}
