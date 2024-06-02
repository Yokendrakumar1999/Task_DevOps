pipeline {
    agent any

    environment {
        ECR_REPO_URI = '784390659805.dkr.ecr.us-east-1.amazonaws.com/devops'
        DOCKER_IMAGE = 'devops'
        AWS_REGION = 'us-east-1'
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'master', url: 'https://github.com/Yokendrakumar1999/Task_DevOps.git'
            }
        }
        
        stage('Install Dependencies') {
            steps {
                sh 'composer install'
            }
        }
        
        stage('Build Docker Image') {
            steps {
                script {
                    dockerImage = docker.build("${ECR_REPO_URI}:${env.BUILD_NUMBER}")
                }
            }
        }
        
        stage('Push to ECR') {
            steps {
                script {
                    withAWS(region: "${AWS_REGION}", credentials: 'aws-credentials') {
                        sh """
                        $(aws ecr get-login --no-include-email --region ${AWS_REGION})
                        docker push ${ECR_REPO_URI}:${env.BUILD_NUMBER}
                        """
                    }
                }
            }
        }
        
        stage('Deploy to EC2') {
            steps {
                script {
                    sh 'scp -i /path/to/devops.pem scripts/deploy.sh ubuntu@204.236.252.173:/home/ubuntu/'
                    sh 'ssh -i /path/to/devops.pem ubuntu@204.236.252.173 "sh /home/ubuntu/deploy.sh ${ECR_REPO_URI}:${env.BUILD_NUMBER}"'
                }
            }
        }
    }
}
