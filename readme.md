

### Commands 

## Git 

# Push les modifs sur dev

- verifier branche de dev : git checkout dev

- git add . 

- git commit -m "commentaire"

- git push origin dev

# Merge dev dans prod 

- verifier branche de prod : git checkout prod 

- git merge dev

- git push origin prod

# Build image

- docker build -t yannis76/prod-web:{tag} -f .

- docker login --username yannis76

- docker push yannis76/prod-web:{tag}

# Connection en ssh a la VM 

- ssh username@ip

# Script de deploiment 

- execution du script de déploiement ./deploy.sh