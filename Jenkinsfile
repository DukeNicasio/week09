pipeline {
    agent any
    stages {
        stage('Clone') {
            steps {
                echo "Cloning repo..."
                checkout scm
            }
        }
        stage('Install Node.js and npm') {
            steps {
                echo "Installing Node.js and npm..."
                sh '''
                curl -sL https://deb.nodesource.com/setup_16.x | bash -
                sudo apt-get install -y nodejs
                '''
            }
        }
        stage('Install Dependencies') {
            steps {
                echo "Installing dependencies..."
                dir('my-app') {
                    sh 'npm install'
                }
            }
        }
        stage('Build') {
            steps {
                echo "Building project..."
                dir('my-app') {
                    sh 'npm run build'
                }
            }
        }
        stage('Test') {
            steps {
                echo "Running tests..."
                dir('my-app') {
                    sh 'npm test'
                }
            }
        }
        stage('Deploy') {
            steps {
                echo "Deploying..."
                dir('my-app') {
                    sh 'firebase deploy --only hosting'
                }
            }
        }
    }
}
