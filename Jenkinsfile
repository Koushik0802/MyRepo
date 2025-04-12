pipeline {
    agent any

    environment {
        DEPLOY_DIR = '/home/ubuntu/Calculator'
        IMAGE_NAME = 'calculator'
        IMAGE_TAG = "${BUILD_NUMBER}"
    }

    stages {
        stage('Checkout') {
            steps {
                git url: 'https://github.com/Koushik0802/MyRepo.git', branch: 'main'
            }
        }

        stage('Build') {
            steps {
                echo "Building the project..."
                sh 'mvn clean package'
            }
        }

        stage('Test & deploy') {
            steps {
                echo "Running tests..."
                sh 'mvn test'
                echo "deploying..."
                sh 'cp /var/lib/jenkins/workspace/Jenkins/target/calculator-app-1.0.jar  ${DEPLOY_DIR}'
            }
        }


        stage('Build Docker Image') {
            steps {
                echo "Building Docker image..."
                sh "docker build -t ${IMAGE_NAME}:${IMAGE_TAG} ."
            }
        }
    }

    post {
        success {
            echo "✅ Build and Deployment completed successfully!"
        }
        failure {
            echo "❌ Something went wrong in the pipeline."
        }
    }
}
