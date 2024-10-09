FROM wordpress:latest

COPY ./web/ /var/www/html/

EXPOSE 80
