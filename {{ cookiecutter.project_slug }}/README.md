# Skel  (vc80be33)

## Pré-requis

Les logiciels suivant doivent être installés sur la machine hôte :

- [Github CLI](https://cli.github.com/)
- [Docker](https://www.docker.com/)

## Présentation

### Principales fonctionnalités

- Squelette d'un projet d'application
- Permet de créer un modèle jumeau adaptable  

### Services

#### Application

- `apache` : Image Docker basée sur l'image [php:apache](https://hub.docker.com/layers/php/library/php/7.4.8-apache/images/sha256-d64789a928c6ff660e94567ad044aec6dded6a5b2cc60ee6f131ae50b1b6d53a?context=explore). Elle embarque les sources de l'application
- `db` : Serveur des bases de données de l'application

#### Outils de maintenance et surveillance

- [`adminer`](https://www.adminer.org) : Interface graphique de gestion des bases de données du service `db`
- [`portainer`](https://www.portainer.io) : Interface graphique de gestion du serveur Docker
- [`traefik`](https://www.traefik.io) : Routeur HTTP et TCP. Point d'entrée vers les différents services de l'applications


## Utilisation

### Création d'un nouveau projet à partir de skel

```sh
cookiecutter https://github.com/kobischE/skel.git
```

## Développement

### Commandes 

- test : création d'un projet à partir des sources locales du squelette

```sh
make test
```

- help : Affichage de ce message d'aide et des informations urls publiques

```sh
make help
```

















