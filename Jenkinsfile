pipeline {
    agent any

    environment {
        // Firebase project ID
        FIREBASE_PROJECT = 'week9'
        // Path to the Firebase Hosting public folder
        PUBLIC_FOLDER = 'dist' // หรือ public folder ของโปรเจกต์ของคุณ
    }

    stages {
        stage('Clone') {
            steps {
                echo "Cloning repository..."
                checkout scm
            }
        }
        
        stage('Install Dependencies') {
            steps {
                echo "Installing dependencies..."
                script {
                    // Install NodeJS
                    sh 'npm install'
                }
            }
        }

        stage('Build') {
            steps {
                echo "Building project..."
                script {
                    // Build the web application (if it's an Angular/React app, etc.)
                    sh 'npm run build'
                }
            }
        }

        stage('Test') {
            steps {
                echo "Running tests..."
                script {
                    // Run tests if necessary
                    sh 'npm test' // ปรับคำสั่งให้ตรงกับแอพของคุณ
                }
            }
        }

        stage('Deploy') {
            steps {
                echo "Deploying to Firebase Hosting..."
                script {
                    // Login to Firebase CLI
                    withCredentials([string(credentialsId: 'firebase-token', variable: 'FIREBASE_TOKEN')]) {
                        sh 'firebase deploy --only hosting --token $FIREBASE_TOKEN'
                    }
                }
            }
        }
    }

    post {
        success {
            echo 'Deployment successful!'
        }
        failure {
            echo 'Deployment failed!'
        }
    }
}
