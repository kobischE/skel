

# Docker-compose

## On crée un fichier  'Dockerfile' dans lequel on va définir l'environnement d'execution, par exemple pdo, php...

```
FROM php:apache
RUN docker-php-ext-install pdo pdo_mysql
COPY ./src /var/www/html/
```

## Et un fichier 'docker-compose.yml' dans lequel on determine les différents services et on les configure  

```
version: '3'
services:

    mysql: 
        image: mysql:5.7.31 
        environment: 
            MYSQL_ROOT_PASSWORD: aav
            MYSQL_DATABASE: {{ cookiecutter.project_slug }}
        volumes: 
            - ./src/bdd.sql:/docker-entrypoint-initdb.d/bdd.sql    

    adminer:
        image: adminer:latest  
        labels:
            - "traefik.enable=true"
            - "traefik.http.routers.adminer.entrypoints=web"
            - "traefik.http.routers.adminer.rule=Host(`adminer.{{ cookiecutter.project_slug }}.localhost`)"  
        
    php:
        build: .
        image: kobische/skel
        labels:
            - "traefik.enable=true"
            - "traefik.http.routers.php.entrypoints=web"
            - "traefik.http.routers.php.rule=Host(`php.{{ cookiecutter.project_slug }}.localhost`)"

```            


# Portainer : making container management easier

## Installation : https://www.portainer.io/installation/

```
$ docker volume create portainer_data
$ docker run -d -p 8000:8000 -p 9000:9000 --name=portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer

```


# Makefile
## Création d'un fichier Makefile dans lequel on va définir des commandes qu'on utilise souvent par exemple : 

```
start: ## demarrer
	docker-compose up --build -d
```

- On peut lui demander d'executer toujours une commande avant un autre : 
```
clean: stop ## supprimer
	docker-compose rm -f
```
Ici avant de supprimer un container il va d'abord l'arrêter    


- On peut aussi executer plusieurs commandes :
```
portainer-open: portainer ## ouvrir portainer dans le navigateur	
	sleep 3 
	browse http://localhost:9000/#/home
```
ici portainer va s'ouvrir dans le browser et marquer un temps de 3 sec


# Installation de Traefik : Traefik is an open-source Edge Router  : https://docs.traefik.io/

## Dans le fichier : docker-compose.yml
on ajoute : 

```
  traefik:
    command:
      - "--api.insecure=true"
      - "--providers.docker=true"
      - "--providers.docker.exposedbydefault=false"
      - "--entrypoints.web.address=:80"
    image: traefik:v2.2.8
    ports:
      - "80:80"
      - "8080:8080"
    volumes:
       - /var/run/docker.sock:/var/run/docker.sock:ro
  ```

On ajoute le label ici à php et adminer : 

```
  labels:
      - "traefik.enable=true"
      - "traefik.http.routers.adminer.entrypoints=web"
      - "traefik.http.routers.adminer.rule=Host(`php.lenomduprojet.localhost`)"
```      



# Création d'un template à partir de skel : https://cookiecutter.readthedocs.io/en/1.7.2/installation.html 

## Création d'un fichier 
```
{{ cookiecutter.project_slug }} 
```
Mettre tout le projet dedans 


## Création d'un fichier 
```
cookiecutter.json 

{
    "project_slug": "Hello"
   
}
```
## Création d'un dossier et Se placer dedans et créer le template: 

```
cookiecutter ../skel/
```
## Définir le nom du projet : 

et c'est parti !! 