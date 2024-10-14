#!/bin/bash

# Configuration
DOCKER_USER="yannis76"
IMAGE_NAME="prod-web"
VERSION="0.0.4"  
DOCKERFILE_PATH="./Dockerfile"
PROD_COMPOSE_FILE="docker-compose.prod.yml"

# Étape 1 : Récupérer la dernière version de la branche prod
echo "Récupération de la dernière version de la branche 'prod'..."
git checkout prod
git pull origin prod

# Étape 2 : Mise à jour de l'image dans le fichier de la stack
echo "Mise à jour de l'image dans la stack..."
sed -i "s|image: $DOCKER_USER/$IMAGE_NAME:.*|image: $DOCKER_USER/$IMAGE_NAME:$VERSION|g" $PROD_COMPOSE_FILE

# Étape 3 : Re-déploiement de la stack Docker en production avec la nouvelle image
echo "Redémarrage de la stack Docker en production..."
docker compose -f $PROD_COMPOSE_FILE down
docker compose -f $PROD_COMPOSE_FILE pull
docker compose -f $PROD_COMPOSE_FILE up -d
