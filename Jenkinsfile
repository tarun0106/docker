pipeline {
    agent { label 'dev' }

    stages {

        stage ('Code') {
            steps {
                git url: 'https://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@github.com/tarunkumar19944/docker-react.git', branch: 'main'
            }
        }
        
        stage ('Build & Test') {
            steps {
                echo 'Build & Test'
                sh 'docker build . -t ajitfawade14/node-todo-app:latest'
            }
        }
        
        stage ('Login & Push Image') {
            steps {
                echo 'Logging in to docker hub and pushing image'
                withCredentials([usernamePassword('credentialsId':'dockerhub', passwordVariable: 'Tarun@1994', usernameVariable: 'tarunkumar01694')]){
                    sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPassword}"
                    sh "docker image push ajitfawade14/node-todo-app:latest"
                }
            }
        }
        
        stage ('Deploy') {
            steps {
                echo 'Deploying'
                sh 'docker-compose down && docker-compose up -d'
            }
        }

    }
}
