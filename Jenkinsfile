pipeline {
    agent any
    environment {
        AWS_ACCOUNT_ID = "784390659805"
        AWS_DEFAULT_REGION = "us-east-1"
        IMAGE_REPO_NAME = "devops1"
        IMAGE_TAG = "latest"
        REPOSITORY_URI = "784390659805.dkr.ecr.us-east-1.amazonaws.com/devops1"
    }
   
    stages {
        stage('Logging into AWS ECR') {
            steps {
                script {
                    sh """
                    aws ecr get-login-password --region ${AWS_DEFAULT_REGION} | docker login --username AWS --password-stdin ${REPOSITORY_URI}
                    """
                }
            }
        }
        
        stage('Cloning Git') {
            steps {
                checkout([$class: 'GitSCM', 
                          branches: [[name: '*/master']], 
                          doGenerateSubmoduleConfigurations: false, 
                          extensions: [], 
                          submoduleCfg: [], 
                          userRemoteConfigs: [[credentialsId: 'your-credentials-id', 
                                               url: 'https://github.com/Yokendrakumar1999/Task_DevOps.git']]])     
            }
        }
  
        stage('Building image') {
            steps {
                script {
                    dockerImage = docker.build("${IMAGE_REPO_NAME}:${IMAGE_TAG}", ".")
                }
            }
        }
   
        stage('Pushing to ECR') {
            steps {
                script {
                    sh """
                    docker tag ${IMAGE_REPO_NAME}:${IMAGE_TAG} ${REPOSITORY_URI}:${IMAGE_TAG}
                    docker push ${REPOSITORY_URI}:${IMAGE_TAG}
                    """
                }
            }
        }
    }
}
