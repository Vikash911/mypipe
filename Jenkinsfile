pipeline {
    agent {
        label "mynode"
    }
    stages {
        stage("SCM"){
            steps{
            git branch: 'main', url: 'https://github.com/Vikash911/mypipe.git'
                }
        }
        stage("build by maven"){
            steps {
                sh " mvn clean package"
                    }
            }
        stage("building the image with help of docker "){
            steps{
                sh "sudo docker build -t myimage:${Image_Version} ." 
              }
            }
        stage("change image name for pushing the image"){
        
            steps{
                withCredentials([string(credentialsId: 'MY_DOCKER_PWD', variable: 'MY_DOCKER_PWD')]) {
                // some block
                sh "sudo docker login -u vikash911 -p $MY_DOCKER_PWD "
                sh "sudo docker tag myimage:${Image_Version} vikash911/myimage:${Image_Version}"
                }
                
            }
              }
        stage("push the image to the docker"){
         steps{
             sh "sudo docker push vikash911/myimage:${Image_Version}"
         }
        }
        stage("QA testing"){
            steps{
            sshagent(['QA_ENV_SSH_CRED']){
                // some block
                 sh "ssh -o StrictHostKeyChecking=no ec2-user@54.227.177.149 sudo docker rm -f $(docker ps -a -q)"
                sh "ssh -o StrictHostKeyChecking=no ec2-user@54.227.177.149 sudo docker run -d -p 8080:8080 --name vikas1  vikash911/myimage:${Image_Version}"
		
            }
        }
        
        }
     }
    }


