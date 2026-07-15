pipeline {
    agent any

    tools {
        jdk 'JDK17'
        maven 'Maven3'
    }

    stages {

        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build') {
            steps {
                sh 'mvn clean package'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t ecommerce-app .'
            }
        }

        stage('Run Docker Container') {
            steps {
                sh '''
                docker stop ecommerce-app || true
                docker rm ecommerce-app || true

                docker run -d \
                --name ecommerce-app \
                -p 8091:8091 \
                ecommerce-app
                '''
            }
        }
    }

    post {
        success {
            echo 'Application deployed successfully.'
        }

        failure {
            echo 'Pipeline failed.'
        }
    }
}
