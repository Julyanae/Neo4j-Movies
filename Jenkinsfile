pipeline {
    agent any
    tools {
        maven 'Maven' // Nom configuré dans Global Tool Configuration
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
                withSonarQubeEnv('SonarQube-Server') { // Nom exact du serveur configuré
                    sh 'mvn clean verify sonar:sonar -Dsonar.projectKey=neo4j-movies'
                }
            }
        }
    }
}
