sudo yum update -y
sudo amazon-linux-extras enable java-openjdk11
sudo yum install java-11-openjdk -y
sudo yum update -y
sudo dnf install java-17-amazon-corretto -y
java -version
sudo curl --silent --location https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key | sudo tee /etc/pki/rpm-gpg/jenkins.io-2023.key > /dev/null
sudo curl --silent --location https://pkg.jenkins.io/redhat-stable/jenkins.repo | sudo tee /etc/yum.repos.d/jenkins.repo > /dev/null
sudo dnf upgrade -y
sudo dnf install jenkins -y
sudo systemctl enable jenkins
systemctl status jenkins
systemctl status jenkin
systemctl status jenkins
cat /etc/yum.repos.d/jenkins.repo
sudo tee /etc/yum.repos.d/jenkins.repo > /dev/null <<EOF
[jenkins]
name=Jenkins-stable
baseurl=https://pkg.jenkins.io/redhat-stable
gpgcheck=1
gpgkey=https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
EOF

sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
sudo dnf clean all
sudo dnf makecache
sudo dnf install jenkins -y
ls /usr/lib/systemd/system/jenkins.service
ls
cd /usr/lib/systemd/system/jenkins.service
sudo systemctl enable jenkins
sudo systemctl start  jenkins
sudo systemctl start jenkins
sudo systemctl status jenkins
ls
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
sudo yum install docker -y
sudo systemctl start docker
sudo systemctl enable docker
sudo usermod -aG docker ec2-user
sudo usermod -aG docker jenkins
sudo reboot
