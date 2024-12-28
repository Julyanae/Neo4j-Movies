pipeline {
    agent any
    stages {
        stage('Cloner le projet') {
            steps {
                git branch: 'main', url: 'https://github.com/Julyanae/Neo4j-Movies.git'
            }
        }
        stage('Analyse SonarQube') {
            environment {
                SONAR_HOST_URL = 'http://localhost:9000' // URL de votre SonarQube
            }
            steps {
                withSonarQubeEnv('SonarQube') { // 'SonarQube' correspond au nom configuré dans Jenkins
                    sh '''
                    mvn clean verify sonar:sonar \
                    -Dsonar.projectKey=neo4j-movies \
                    -Dsonar.projectName="Neo4j-Movies" \
                    -Dsonar.branch.name=main
                    '''
                }
            }
        }
    }
}
