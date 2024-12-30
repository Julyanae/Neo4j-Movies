pipeline {
    agent any
    environment {
        SONAR_TOKEN = credentials('sonar-token')
    }
    tools {
        maven 'Maven' // Nom configuré dans Global Tool Configuration
    }
    stages {
        stage('Cloner le projet') {
            steps {
                git branch: 'main', url: 'https://github.com/Julyanae/Neo4j-Movies.git'
            }
        }

        stage('Analyse SonarQube') {
            steps {
                withSonarQubeEnv('SonarQube-Server') {
                    sh 'mvn clean verify sonar:sonar -Dsonar.projectKey=Neo4j-Movies -Dsonar.login=${SONAR_TOKEN}'
                }
            }
        }
    }
}

