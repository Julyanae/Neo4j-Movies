pipeline {
    agent any
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
            environment {
                SONARQUBE_ENV = credentials('SonarQube') // Nom configuré dans Jenkins
            }
            steps {
                withSonarQubeEnv('SonarQube') {
                    sh 'mvn clean verify sonar:sonar -Dsonar.projectKey=neo4j-movies -Dsonar.host.url=http://localhost:9000'
                }
            }
        }
    }
}

