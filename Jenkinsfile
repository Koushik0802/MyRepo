pipeline {
    agent any
    environment {
        DEPLOY_DIR = '/tmp/Calculator'
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
                sh 'ls -l target'
            }
        }

        stage('Test & Deploy') {
            steps {
                echo "Running tests..."
                sh 'mvn test'
                echo "Deploying..."
                sh 'cp target/calculator-app-1.0.jar ${DEPLOY_DIR}'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    echo "Building Docker image..."
                    sh "docker build -t ${IMAGE_NAME}:${IMAGE_TAG} ."
                    echo "Running container"
                    sh "docker run -d -p 8081:8080 --name Calculator ${IMAGE_NAME}:${IMAGE_TAG}"
                }
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
