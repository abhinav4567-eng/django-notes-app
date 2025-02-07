@Library("Shared") _
pipeline {
    agent {label "vinod"}
    
    stages {
        stage('Hello Library') {
            steps{
                script{
                    hello()
                }
            }
        }
        stage('Code') {
            steps{
                echo "This is for Cloning the code"
                git url: 'https://github.com/abhinav4567-eng/django-notes-app', branch: 'main'
                echo "Code cloned successfully!"
            }    
            
        }
        stage('Build') {
            steps{
                echo "This is building code"
                sh "whoami"
                sh "sudo docker build -t django-app:latest ."
                echo "Hurrah!!, code build successfully!!!"
                
            }
            
        }
       stage('Push to DockerHub') {
           steps{
               echo "This is to pushing the image to Docker Hub"
               withCredentials([usernamePassword(
                   'credentialsId':"DockerHubCredentials",
                    passwordVariable:"dockerHubPass",
                    usernameVariable:"dockerHubUser")]){
               sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPass}"
               sh "docker tag django-app:latest abhinavlv/djangoapp"
               sh "docker push abhinavlv/djangoapp"
               echo "Hurrah, Image pushed to DockerHub successfully!!"
           }
        }
       }
       stage('Deploy') {
           steps{
               echo "This is Composing the code"
               sh "docker compose down && docker compose up -d"
               
           }
       }
    

}
}
