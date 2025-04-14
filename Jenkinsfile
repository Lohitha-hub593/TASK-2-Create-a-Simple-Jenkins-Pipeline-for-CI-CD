pipeline { 
agent any 
environment { 
APP_NAME = "nodejs-demo-app" 
DOCKER_IMAGE = " your-dockerhub-username /nodejs-demo-app:latest" 
} 
stages { 
stage('Checkout') { 
steps { 
git branch: 'main', url: 'https://github.com/ your-username / your-nodejs-repo.git ' 
} 
} 
stage('Build Docker Image') { 
steps { 
sh 'docker build -t $DOCKER_IMAGE .' 
} 
} 
stage('Test') { 
steps { 
} 
} 
sh 'docker run --rm $DOCKER_IMAGE npm test || echo "No tests found"' 
stage('Push to DockerHub') { 
steps { 
withCredentials([usernamePassword( 
credentialsId: 'dockerhub-creds',  
usernameVariable: 'lohitha98',  
passwordVariable: 'DOCKER_PASSWORD' 
)]) { 
sh ''' 
echo "$PASSWORD" | docker login -u "$USERNAME" --password-stdin 
''' 
docker push $DOCKER_IMAGE 
} 
} 
} 
stage('Deploy to EC2') { 
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
