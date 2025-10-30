pipeline {
    agent any

    stages {
        stage("check info") {
            steps {
                sh """
                pwd
                whoami
                ls -la
                """
            }
        }
    }
}