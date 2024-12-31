# Étape 1 : Utiliser une image de base Java
FROM openjdk:17-jdk-slim

# Étape 2 : Définir un répertoire de travail dans le conteneur
WORKDIR /app

# Étape 3 : Copier le fichier JAR généré par Maven dans le conteneur
COPY target/*.jar app.jar

# Étape 4 : Exposer le port 8080
EXPOSE 8080

# Étape 5 : Commande d'exécution
ENTRYPOINT ["java", "-jar", "app.jar"]
