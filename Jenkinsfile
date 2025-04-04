pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'node:16'  // The Docker image to use (you can choose any Node.js version or your custom image)
        REPO_URL = 'https://github.com/Koushik0802/MyRepo.git' // Your GitHub repository URL
        BRANCH = 'main' // Specify the branch you want to pull (e.g., main or master)
    }

    stages {
        stage('Checkout') {
            steps {
                // Clone the GitHub repository
                git branch: "${BRANCH}"
				url: "${REPO_URL}"
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Docker commands to build the image from the Dockerfile
                    sh 'docker build -t helloworld-js Cont .'
                }
            }
        }

        stage('Run in Docker Container') {
            steps {
                script {
                    // Run the JS file inside the container
                    sh 'docker run --rm helloworld-js Cont  node /opt/helloWorld.js'
                }
            }
        }
    }
}
