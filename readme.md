

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

# Connection en ssh a la VM 

- ssh username@ip

# Script de deploiment 

- execution du script de déploiement ./deploy.sh