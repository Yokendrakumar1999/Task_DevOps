pipeline {

    agent any
    stages{
        
    stage('deploy')
    {
            steps
            {
                sh 'cp -r * /var/www/html/'
            }
        }


        stage('deleting Containers')
        {
            steps
            {
                sh 'docker rm $(docker ps -aq)'
            }
        }
   
     stage('deleting images')
        {
            steps
            {
                sh 'docker rmi $(docker images -aq)'
            }
        }
          
          stage('create docker images')
        {
            steps
            {
                sh 'docker build -t devops:v1'
            }
        }
        stage('create docker containers')
        {
            steps{
                sh' docker run -d --name devops -p 80:80 devops:v1'
            }
        }
   
   
    }
}
