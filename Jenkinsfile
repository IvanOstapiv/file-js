pipeline {
    agent any

    tools {
        nodejs 'nodejs'
    }

    stages {
        stage('Stop running container') {
            steps {
                sh 'docker ps -a -q --filter name=filejs | xargs -r docker stop'
                sh 'docker ps -a -q --filter name=filejs | xargs -r docker rm -f'
            }
        }
        stage('Rm old docker image') {
             steps {
                 sh 'docker images -q filejs | xargs -r docker image rm'
             }
         }
        stage('Build docker image') {
            steps {
                sh 'docker build -t ostapiv333/filejs -f Dockerfile .'
            }
        }

        stage('Deploy') {
            steps {
                sh 'docker run --name=filejs ostapiv333/filejs'
            }
        }
    }

    post {
        success {
            // Дії, які виконуються при успішному завершенні
            echo 'Build and deployment succeeded!'
        }
        failure {
            // Дії, які виконуються при невдачі
            echo 'Build or deployment failed!'
        }
    }
}
