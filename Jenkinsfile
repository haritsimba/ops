pipeline {
    agent any

    stages {
        stage('checkout') {
            steps {
                git branch: 'develop', url: 'https://github.com/haritsimba/ops.git'
            }
        }
        stage('build') {
            steps {
                sh 'mvn clean package'
            }
        }
        stage('test'){
            steps {
                sh 'mvn test'
            }
        }
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t spring-api:latest .'
            }
        }
        stage('deploy') {
            steps {
                sh 'docker run --name spring -p 8081:8081 spring-app'
            }
        }
    }
}
