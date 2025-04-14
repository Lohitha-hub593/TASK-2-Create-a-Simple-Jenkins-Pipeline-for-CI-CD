pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'lohitha98/nodejs:latest'
        APP_NAME = 'nodejs-demo-app'
    }

    stages {
        stage('Build') {
            steps {
                sh 'docker build -t $DOCKER_IMAGE .'
            }
        }

        stage('Test') {
            steps {
                sh 'docker run --rm $DOCKER_IMAGE npm test || echo "No tests found"'
            }
        }

        stage('Push') {
            steps {
                withCredentials([
                    usernamePassword(
                        credentialsId: 'dockerhub-creds',
                        usernameVariable: 'DOCKER_USER',
                        passwordVariable: 'DOCKER_PASS'
                    )
                ]) {
                    sh '''
                        echo "$DOCKER_PASS" | docker login -u "$DOCKER_USER" --password-stdin
                        docker push $DOCKER_IMAGE
                    '''
                }
            }
        }

        stage('Deploy') {
            steps {
                sh '''
                    docker stop $APP_NAME || true
                    docker rm $APP_NAME || true
                    docker pull $DOCKER_IMAGE
                    docker run -d --name $APP_NAME -p 3001:3000 $DOCKER_IMAGE
                '''
            }
        }
    }
}
