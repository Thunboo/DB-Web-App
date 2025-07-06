pipeline {
    agent any

    environment {
        COMPOSE_PROJECT_NAME = "flask-app"
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'only-flask', url: 'https://github.com/Thunboo/DB-Web-App.git'
            }
        }

        stage('Build') {
            steps {
                sh 'docker build -t flask-app .'
                // sh 'docker-compose up -d database'
                // sh 'docker-compose build webapp'
                // sh 'docker-compose run webapp pytest'
            }
        }

        stage('Deploy') {
            steps {
                sh 'docker run -d -p 5000:5000 --name flask-app flask-app'
                // sh 'docker-compose down' // stop test containers
                // sh 'docker-compose up -d --build'
            }
        }
    }

    post {
        always {
            sh 'docker stop flask-app'
            echo 'Waiting for container to stop'
            sleep(time: 10, unit: 'SECONDS')
            sh 'docker rm flask-app'
            // sh 'docker-compose down'
        }
    }
}