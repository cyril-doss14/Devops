pipeline {
    agent any
    stages {
        stage('Build and Push') {
            steps {
                script {
                    def branchName = env.BRANCH_NAME ?: env.GIT_BRANCH
                    branchName = branchName.replaceAll(/^origin\//, '').trim()
                    echo "Current branch: ${branchName}"

                    if (branchName == 'dev' || branchName == 'master') {
                        sh "chmod +x ./build.sh"
                        sh "./build.sh ${branchName}"
                        withCredentials([usernamePassword(credentialsId: "${DOCKER_REGISTRY_CREDS}", usernameVariable: 'DOCKER_HUB_USERNAME', passwordVariable: 'DOCKER_HUB_PASSWORD')]) {
                            sh "echo ${DOCKER_HUB_PASSWORD} | docker login -u ${DOCKER_HUB_USERNAME} --password-stdin"
                        }
                    } else {
                        error("Branch name does not match 'dev' or 'master'. Skipping Docker image push.")
                    }
                }
            }
        }
        stage('Deploy') {
            steps {
                script {
                    def branchName = env.BRANCH_NAME ?: env.GIT_BRANCH
                    branchName = branchName.replaceAll(/^origin\//, '').trim()
                    if (branchName == 'dev' || branchName == 'master') {
                        sh "chmod +x ./deploy.sh"
                        sh "./deploy.sh ${branchName}"
                    } else {
                        error("Branch name does not match 'dev' or 'master'. Skipping deployment.")
                    }
                }
            }
        }
    }
}
