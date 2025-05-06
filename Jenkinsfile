pipeline {
    agent any

    environment {
        FIREBASE_PROJECT_ID = 'your-firebase-project-id'
        FIREBASE_TOKEN = credentials('firebase-token')  // ใช้ Jenkins credentials เพื่อเก็บ Firebase token
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/username/repository.git'
            }
        }

        stage('Install Dependencies') {
            steps {
                script {
                    
                    sh 'npm install'
                }
            }
        }

        stage('Build') {
            steps {
                script {
                    // ใช้คำสั่ง Vite เพื่อ build แอป
                    sh 'npm run build'
                }
            }
        }

        stage('Deploy to Firebase Hosting') {
            steps {
                script {
                    // ใช้ Firebase CLI เพื่อ Deploy
                    sh 'firebase deploy --project $FIREBASE_PROJECT_ID --token $FIREBASE_TOKEN'
                }
            }
        }
    }

    post {
        success {
            echo 'Deployment completed successfully.'
        }
        failure {
            echo 'Deployment failed.'
        }
    }
}
