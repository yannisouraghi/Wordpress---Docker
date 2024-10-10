# Workflow de Développement avec Docker, WordPress, Git et Docker Hub

Ce projet contient deux environnements Docker (développement et production) pour un site WordPress. Le workflow inclut l'utilisation de branches Git, le push d'images sur Docker Hub, et la mise à jour de l'environnement de production avec des images versionnées.

## Structure des environnements

- **Environnement de Développement (dev)** : Mappé sur la branche `dev` de Git.

- **Environnement de Production (prod)** : Mappé sur la branche `prod` de Git. 

## Commandes pour démarrer les environnements Docker

### Démarrer l'environnement de développement

docker-compose -f docker-compose.dev.yml up -d

### Démarrer l'environnement de prod

docker-compose -f docker-compose.prod.yml up -d


## Workflow Git 

Ajouter un vardump('Ceci est l'environnement de dev')

git add .
git commit -m "Modification dans l'environnement de dev"
git push origin dev


### Merge dev dans prod 

git checkout prod
git merge dev
git push origin prod

## Workflow docker 

git checkout prod
git pull origin prod

docker build -t yannis76/prod-web:0.0.1 .
docker push yannis76/prod-web:0.0.1


### Mettre à jour l'image dans le docker-compose de prod

### Puis recréer et relancer les services de prod 

docker-compose -f docker-compose.prod.yml pull
docker-compose -f docker-compose.prod.yml up -d
