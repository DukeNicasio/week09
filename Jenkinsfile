pipeline {
    agent any
    stages {
        stage('Clone') {
            steps {
                echo "Cloning repo..."
                checkout scm
            }
        }
        stage('Install Dependencies') {
            steps {
                echo "Installing dependencies in my-app directory..."
                dir('my-app') {
                    sh 'npm install'
                }
            }
        }
        stage('Build') {
            steps {
                echo "Building project..."
                dir('my-app') {
                    sh 'npm run build'  // ถ้าคุณมีคำสั่ง build ใน my-app
                }
            }
        }
        stage('Test') {
            steps {
                echo "Running tests..."
                dir('my-app') {
                    sh 'npm test'  // ถ้าคุณมีคำสั่ง test ใน my-app
                }
            }
        }
        stage('Deploy') {
            steps {
                echo "Deploying..."
                dir('my-app') {
                    // ตัวอย่างคำสั่ง deploy ไป Firebase Hosting
                    sh 'firebase deploy --only hosting'
                }
            }
        }
    }
}
