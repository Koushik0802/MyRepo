pipeline {
    agent any

    environment {
        DEPLOY_DIR = '/opt/calculator-app' 
		IMAGE_NAME = 'calculator'
        IMAGE_TAG = '1.0'
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

        stage('Test') {
            steps {
                echo "Running tests..."
                sh 'mvn test'
            }
        }
        		stage('Build Docker Image') {
            steps {
                script 
                {
                    sh "docker build -t ${IMAGE_NAME}:${IMAGE_TAG} ."
                }
            }
        }
        stage('Deploy')
		{
            steps {
                echo "Deploying JAR to $DEPLOY_DIR"
                sh """
                    mkdir -p $DEPLOY_DIR
                    cp target/*.jar $DEPLOY_DIR/
                """
            }
        }
		

    }

    post {
        success {
            echo "Build and Deployment completed successfully!"
        }
        failure {
            echo "Something went wrong in the pipeline."
        }
    }
}
