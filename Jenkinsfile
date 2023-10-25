pipeline {
    agent any

    tools {
        nodejs 'nodejs'
    }

    stages {
        stage('Stop running container') {
            steps {
                sh 'docker ps -a -q --filter name=fileJS | xargs -r docker stop'
                sh 'docker ps -a -q --filter name=fileJS | xargs -r docker rm -f'
            }
        }
        stage('Rm old docker image') {
             steps {
                 sh 'docker images -q fileJS | xargs -r docker image rm'
             }
         }
        stage('Build docker image') {
            steps {
                sh 'docker build -t ostapiv333/fileJS -f Dockerfile .'
            }
        }

        stage('Deploy') {
            steps {
                sh 'docker run -d --restart=always --name=fileJS ostapiv333/fileJS'
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
