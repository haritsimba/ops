pipeline {
    agent any

    stages {

        steps {
                sh '''
                docker run --rm \
                  -v $PWD:/app \
                  -w /app \
                  maven:3.9.9-eclipse-temurin-21 \
                  mvn clean package
                '''
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
