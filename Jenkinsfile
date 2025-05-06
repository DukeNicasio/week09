pipeline {
    agent any

    stages {
        stage('Clone') {
            steps {
                echo "Cloning repository..."
                checkout scm
            }
        }

        stage('Install Dependencies') {
            steps {
                dir('my-app') {
                    echo "Installing npm dependencies..."
                    sh 'npm install'
                }
            }
        }

        stage('Build') {
            steps {
                dir('my-app') {
                    echo "Building the app..."
                    sh 'npm run build'
                }
            }
        }

        stage('Deploy to Firebase Hosting') {
            steps {
                dir('my-app') {
                    echo "Deploying to Firebase..."
                    sh 'firebase deploy --only hosting'
                }
            }
        }
    }
}
