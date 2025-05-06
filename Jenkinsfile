pipeline {
    agent {
        docker {
            image 'node:20' // ใช้ node ที่รองรับ build ได้เลย
        }
    }
    environment {
        FIREBASE_TOKEN = credentials('firebase_token') // ใช้ Jenkins Credential ชื่อ firebase_token
    }
    stages {
        stage('Clone') {
            steps {
                echo "Cloning repo..."
                checkout scm
            }
        }
        stage('Install Firebase CLI') {
            steps {
                echo "Installing Firebase CLI..."
                sh 'npm install -g firebase-tools'
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
                echo "Deploying to Firebase Hosting..."
                dir('my-app') {
                    sh 'firebase deploy --only hosting --token "$FIREBASE_TOKEN"'
                }
            }
        }
    }
}
