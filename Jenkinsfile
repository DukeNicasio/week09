pipeline {
    agent any

    stages {
        stage('Clone') {
            steps {
                checkout scm
            }
        }
        stage('Install Dependencies') {
            steps {
                dir('my-app') {
                    sh 'npm install'
                }
            }
        }
        stage('Build') {
            steps {
                dir('my-app') {
                    sh 'npm run build'
                }
            }
        }
        stage('Deploy') {
            steps {
                dir('my-app') {
                    withCredentials([string(credentialsId: 'FIREBASE_TOKEN', variable: 'FIREBASE_TOKEN')]) {
                        sh 'firebase deploy --only hosting --token "$FIREBASE_TOKEN"'
                    }
                }
            }
        }
    }
}
