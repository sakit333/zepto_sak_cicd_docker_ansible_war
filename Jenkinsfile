pipeline {
    agent any

    environment {
        PROJECT_NAME = "zepto_sak_cicd_docker_ansible_war"
        DOCKERHUB_USERNAME = "sakit333"
        DOCKERHUB_REPO = "zepto_sak"
    }
    stages {
        stage("check info") {
            steps {
                echo "Project Docker Images creating.....!"
                sh "sudo docker build -t ${DOCKERHUB_USERNAME}/${DOCKERHUB_REPO}:latest ."
            }
        }
        stage("Asign Tag to Docker Image") {
            steps {
                script {
                    def buildNumber = env.BUILD_ID
                    sh "sudo docker tag ${DOCKERHUB_USERNAME}/${DOCKERHUB_REPO}:latest ${DOCKERHUB_USERNAME}/${DOCKERHUB_REPO}:${buildNumber}"
                }
            }
        }
        stage("Login to DockerHub") {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub-credentials', usernameVariable: 'DOCKERHUB_USER', passwordVariable: 'DOCKERHUB_PASS')]) {
                    sh "echo $DOCKERHUB_PASS | sudo docker login -u $DOCKERHUB_USER --password-stdin"
                }
            }
        }
        stage("Push Docker Image to DockerHub") {
            steps {
                script {
                    def buildNumber = env.BUILD_ID
                    sh "sudo docker push ${DOCKERHUB_USERNAME}/${DOCKERHUB_REPO}:latest"
                    sh "sudo docker push ${DOCKERHUB_USERNAME}/${DOCKERHUB_REPO}:${buildNumber}"
                }
            }
        }
    }
}