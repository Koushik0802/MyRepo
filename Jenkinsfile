pipeline {
    agent any

    environment {
        DEPLOY_DIR = 'E:/git/calculator-app' 
		IMAGE_NAME = 'calculator'
        IMAGE_TAG = '1.0'
    }

    stages {
        stage('Checkout') {
            steps {
               git url: 'https://github.com/Koubatik0802/MyRepo.git', branch: 'main'
            }
        }

        stage('Build') {
            steps {
                echo "Building the project..."
                bat 'mvn clean package'
            }
        }

        stage('Test') {
            steps {
                echo "Running tests..."
                bat 'mvn test'
            }
        }

        stage('Deploy')
		{
            steps {
                echo "Deploying JAR to $DEPLOY_DIR"
                bat """
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
