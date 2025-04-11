pipeline {
    agent any

    environment {
        // Set your Docker image name and tag
        IMAGE_NAME = 'calculator'
        IMAGE_TAG = '1.0'
    }

    stages {
        stage('Checkout') {
            steps {
                git url: 'https://github.com/Koushik0802/MyRepo.git', branch: 'main'
            }
        }

        stage('Build with Maven') {
            steps {
                sh 'mvn clean package -DskipTests'
            }
        }

        stage('Test') {
            steps {
                sh 'mvn test'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh "docker build -t ${IMAGE_NAME}:${IMAGE_TAG} ."
                }
            }
        }
    }
}
