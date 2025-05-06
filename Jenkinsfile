pipeline {
    agent any

    environment {
        FIREBASE_TOKEN = credentials('firebase-token') // ใช้ Jenkins Credential
    }

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
                    curl -sL https://deb.nodesource.com/setup_20.x | bash -
                    apt-get install -y nodejs
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

        stage('Deploy to Firebase') {
            steps {
                echo "Deploying to Firebase..."
                dir('my-app') {
                    sh 'npx firebase deploy --only hosting --token $FIREBASE_TOKEN'
                }
            }
        }
    }
}
