pipeline{
    agent any
    environment{
        registry='lrguezm/dice'
        registryCredentials='dockerhub'
        project='jenkins-example'
        projectVersion='1.0'
        repository='https://github.com/rguezmoralaura/dado.git'
    }
    stages{
        stage('Clean workspace'){
            steps{
                cleanWs()
            }
        }
        stage('Checkout code'){
            steps{
                script{
                    git branch: 'feature/rol',
                    url: repository
                }
            }
        }
        stage('Build'){
            steps{
                script{
                    dockerImage= docker.build registry
                }
            }
        }
        stage('Test'){
            steps{
                script{
                    try{
                        sh 'docker run --name $project $registry'
                    }finally{
                        sh 'docker rm $project'
                    }
                }
            }
        }
        stage('Deploy'){
            steps{
                script{
                    docker.withRegistry('',registryCredentials){
                        dockerImage.push()
                    }
                }
            }
        }
        stage('Cleaning up'){
            steps{
                script{
                    sh 'docker rmi $registry'
                }
            }
        }
    }
    post{
        always{
            echo 'Registrar Build'
        }
    }
}