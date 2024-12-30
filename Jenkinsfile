pipeline {
    agent any
    tools {
        maven 'Maven' // Nom configuré dans Global Tool Configuration
    }
    environment {
        SONAR_TOKEN = credentials('sonar-token') // Remplacez 'sonar-token' par l'ID de vos credentials dans Jenkins
    }
    stages {
        stage('Cloner le projet') {
            steps {
                // Cloner le dépôt Git spécifié
                git branch: 'main', url: 'https://github.com/Julyanae/Neo4j-Movies.git'
            }
        }

        stage('Analyse SonarQube') {
            steps {
                // Analyse avec SonarQube
                withSonarQubeEnv('SonarQube-Server') {
                    sh 'mvn clean verify sonar:sonar -Dsonar.projectKey=neo4j-movies -Dsonar.login=${SONAR_TOKEN}'
                }
            }
        }
    }
}
