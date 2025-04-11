pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Building the application...'
                sh 'docker build -t my-app-image .'
            }
        }

        stage('Test') {
            steps {
                echo 'Running tests...'
                sh 'echo "Pretend this is a test command"'
            }
        }

        stage('Deploy') {
            steps {
                echo 'Deploying the application...'
                sh 'docker run -d -p 8080:8080 my-app-image'
            }
        }
    }
}

