pipeline {
    agent none
    stages {
        // Executing for all the branches.
        stage('test') {
            steps {
                echo "Testing the application..."
                echo "Executing pipeline for the branch $BRANCH_NAME"
            }
        }

        stage('build') {
            when {
                expression {
                    // Running for main branch only.
                    // Env variable that is for multibranch pipelines.
                    BRANCH_NAME == 'main'
                }
            }
            steps {
                echo "Building the application..."
            }
        }

        stage('deploy') {
            when {
                expression {
                    // Running for main branch only.
                    // Env variable that is for multibranch pipelines.
                    BRANCH_NAME == 'main'
                }
            }
            steps {
                script {
                    // The image from the docker hub.
                    def dockerCmd = 'docker run -p 3080:3080 -d arshashiri/demo-app:node-app-1.0'
                    sshagent(['ec2-server-key']) {
                        // Connect to the ec2 server and run the docker container.
                        sh "ssh -o StrictHostKeyChecking=no ec2-user@3.71.176.75 ${dockerCmd}"
                    }

                    echo "Deploying the application..."
                }
            }
        }
    }
}