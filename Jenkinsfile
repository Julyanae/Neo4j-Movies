pipeline {
    agent any
    environment {
        DOCKER_IMAGE = 'neo4j-movies-app:latest' // Nom de l'image Docker
    }
    stages {
        stage('Cloner le projet') {
            steps {
                git branch: 'main', url: 'https://github.com/Julyanae/Neo4j-Movies.git'
            }
        }
        stage('Analyse SonarQube') {
            tools {
                maven 'Maven'
            }
            steps {
                withSonarQubeEnv('SonarQube-Server') {
                    sh 'mvn clean verify sonar:sonar -Dsonar.projectKey=Neo4j-Movies -Dsonar.login=${SONAR_TOKEN}'
                }
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    sh "docker build -t ${DOCKER_IMAGE} ."
                }
            }
        }
        stage('Push Docker Image to DockerHub') {
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: 'dockerhub-credentials', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                        sh "echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin"
                        sh "docker tag ${DOCKER_IMAGE} ${DOCKER_USER}/${DOCKER_IMAGE}"
                        sh "docker push ${DOCKER_USER}/${DOCKER_IMAGE}"
                    }
                }
            }
        }
        stage('Deploy and Start the Dockerized Project') {
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: 'dockerhub-credentials', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                        sh "docker pull ${DOCKER_USER}/${DOCKER_IMAGE}"
                        sh """
                        if [ \$(docker ps -aq -f name=neo4j-movies-app) ]; then
                            docker rm -f neo4j-movies-app
                        fi
                        """
                        sh "docker run -d --name neo4j-movies-app -p 8082:8081 ${DOCKER_USER}/${DOCKER_IMAGE}"
                    }
                }
            }
        }
    }
}
