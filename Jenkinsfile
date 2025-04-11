pipeline {
    agent any

    environment {
        IMAGE_NAME = 'calculator'
        IMAGE_TAG = '1.0'
        DOCKER_HUB_REPO = 'koushik0805/calculator'
        // The ID of your Docker Hub credentials stored in Jenkins
        DOCKER_CREDENTIALS_ID = 'PipelineSCM'
    }

    stages {
        stage('Checkout') {
            steps {
                git url: 'https://github.com/Koushik0802/MyRepo.git', branch: 'main'
            }
        }

        stage('Build with Maven') {
            steps {
                sh 'ls -la
                sh 'mvn clean package -DskipTests'
                 dir("${env.WORKSPACE}") 
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

        stage('Push to Docker Hub') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', "${DOCKER_CREDENTIALS_ID}") {
                        sh "docker tag ${IMAGE_NAME}:${IMAGE_TAG} ${DOCKER_HUB_REPO}:${IMAGE_TAG}"
                        sh "docker push ${DOCKER_HUB_REPO}:${IMAGE_TAG}"
                    }
                }
            }
        }
    }

    post {
        always {
            cleanWs()
        }
    }
}
