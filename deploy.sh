#!/bin/bash

# Configuration
DOCKER_USER="yannis76"
IMAGE_NAME="prod-web"
VERSION="0.0.3"  
DOCKERFILE_PATH="./Dockerfile"
PROD_COMPOSE_FILE="docker-compose.prod.yml"

# Étape 1 : Récupérer la dernière version de la branche prod
echo "Récupération de la dernière version de la branche 'prod'..."
git checkout prod
git pull origin prod

# Étape 2 : Construire une nouvelle image Docker
echo "Construction de l'image Docker..."
docker build -t $DOCKER_USER/$IMAGE_NAME:$VERSION -f $DOCKERFILE_PATH .

# Étape 3 : Push de l'image sur Docker Hub
echo "Push de l'image sur Docker Hub..."
docker login --username $DOCKER_USER
docker push $DOCKER_USER/$IMAGE_NAME:$VERSION

# Étape 4 : Mise à jour de l'image dans le fichier de la stack
echo "Mise à jour de l'image dans la stack..."
sed -i "s|image: $DOCKER_USER/$IMAGE_NAME:.*|image: $DOCKER_USER/$IMAGE_NAME:$VERSION|g" $PROD_COMPOSE_FILE

# Étape 5 : Re-déploiement de la stack Docker en production avec la nouvelle image
echo "Redémarrage de la stack Docker en production..."
docker-compose -f $PROD_COMPOSE_FILE down
docker-compose -f $PROD_COMPOSE_FILE pull
docker-compose -f $PROD_COMPOSE_FILE up -d
