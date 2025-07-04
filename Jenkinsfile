pipeline {
    agent any

    environment {
        COMPOSE_PROJECT_NAME = "flask-app"
    }

    stages {
        stage('Install Docker Compose') {
            steps {
                sh '''
                    curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
                    chmod +x /usr/local/bin/docker-compose
                '''
            }
        }
        
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/Thunboo/DB-Web-App.git'
            }
        }

        stage('Build & Test') {
            steps {
                sh 'docker-compose up -d database'
                sh 'docker-compose build webapp'
                // sh 'docker-compose run webapp pytest'
            }
        }

        stage('Deploy') {
            steps {
                sh 'docker-compose down' // stop test containers
                sh 'docker-compose up -d --build'
            }
        }
    }

    post {
        always {
            sh 'docker-compose down'
        }
    }
}