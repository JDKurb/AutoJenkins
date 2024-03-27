pipeline {
    agent any
    stages{
        stage("Checkout") {
            steps {
                checkout scm
            }
        }
        stage("npm install") {
            steps {
                sh 'npm install'
            }
        }
        stage('Build') {
            steps {
                //todo
            }
        }
        stage('Deploy') {
            steps{
                //todo
            }
        }
    }
}