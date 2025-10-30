pipeline {
    agent any

    environment {
        PROJECT_NAME = "zepto_sak_cicd_docker_ansible_war"
        DOCKERHUB_USERNAME = "sakit333"
        DOCKERHUB_REPO = "zepto_sak"
    }
    stages {
        stage("Build Docker Image") {
            steps {
                echo "Project Docker Images creating.....!"
                sh "sudo docker build -t ${DOCKERHUB_USERNAME}/${DOCKERHUB_REPO}:latest ."
            }
            post {
                success {
                    echo "Docker image built successfully."
                }
                failure {
                    echo "Docker image build failed."
                }
            }
        }
        stage("Asign Tag to Docker Image") {
            steps {
                script {
                    def buildNumber = env.BUILD_ID
                    sh "sudo docker tag ${DOCKERHUB_USERNAME}/${DOCKERHUB_REPO}:latest ${DOCKERHUB_USERNAME}/${DOCKERHUB_REPO}:${buildNumber}"
                }
            }
            post {
                success {
                    echo "Docker image tagged successfully."
                }
                failure {
                    echo "Failed to tag Docker image."
                }
            }
        }
        stage("Login to DockerHub") {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub-credentials', usernameVariable: 'DOCKERHUB_USER', passwordVariable: 'DOCKERHUB_PASS')]) {
                    sh "echo $DOCKERHUB_PASS | sudo docker login -u $DOCKERHUB_USER --password-stdin"
                }
            }
            post {
                success {
                    echo "Logged in to DockerHub successfully."
                }
                failure {
                    echo "DockerHub login failed."
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
            post {
                success {
                    echo "Docker images pushed to DockerHub successfully."
                }
                failure {
                    echo "Failed to push Docker images to DockerHub."
                }
            }
        }
        stage("Remove Local Docker Images") {
            steps {
                script {
                    def buildNumber = env.BUILD_ID
                    sh "sudo docker rmi ${DOCKERHUB_USERNAME}/${DOCKERHUB_REPO}:latest"
                    sh "sudo docker rmi ${DOCKERHUB_USERNAME}/${DOCKERHUB_REPO}:${buildNumber}"
                }
            }
            post {
                success {
                    echo "Local Docker images removed successfully."
                }
                failure {
                    echo "Failed to remove local Docker images."
                }
            }
        }
        stage("Logout from DockerHub") {
            steps {
                sh "sudo docker logout"
            }
        }
        stage('Copy deploy playbook to ansible user') {
            steps {
                sh '''
                echo "Copying deploy playbook to ansible user..."
                sudo cp "$WORKSPACE/deploy-container.yml" /home/ansible/
                sudo chown ansible:ansible /home/ansible/deploy-container.yml
                echo "File copied successfully!"
                '''
            }
            post {
                success {
                    echo "Playbook copied to ansible user successfully."
                }
                failure {
                    echo "Failed to copy playbook to ansible user."
                }
            }
        }
        stage('Run Ansible Playbook') {
            steps {
                sh '''
                sudo -u ansible ansible-playbook /home/ansible/deploy-container.yml
                '''
            }
            post {
                success {
                    echo "Ansible playbook executed successfully."
                }
                failure {
                    echo "Ansible playbook execution failed."
                }
            }
        }
    }
    post {
        always {
            echo "Pipeline completed."
        }
        success {
            echo "Pipeline succeeded!"
        }
        failure {
            echo "Pipeline failed!"
        }
    }
}