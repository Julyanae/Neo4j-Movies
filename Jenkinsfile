pipeline {
    agent any
    tools {
        maven 'Maven' 
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
                    sh 'mvn clean verify sonar:sonar -Dsonar.projectKey=Neo4j-Movies'
                }
            }
        }
        stage('Build') {
            steps {
                sh 'mvn clean package'
            }
        }
    }
}
