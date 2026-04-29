pipeline {
    agent any

    stages {

         stage('Build Maven') {
            steps {
                sh 'mvn clean package'
            }
        }

        stage('Test') {
            steps {
                sh 'mvn test'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t spring-api:latest .'
            }
        }

        stage('Deploy DEV') {
            steps {
                sh 'docker run -d -p 8081:8081 --name api-dev spring-api:latest || true'
            }
        }

        stage('Deploy PREPROD') {
            steps {
                sh 'docker run -d -p 8082:8081 --name api-preprod spring-api:latest || true'
            }
        }

        stage('Deploy PROD') {
            steps {
                input "Valider déploiement PROD ?"
                sh 'docker run -d -p 8083:8081 --name api-prod spring-api:latest || true'
            }
        }
    }
}
