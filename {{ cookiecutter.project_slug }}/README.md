# skel

## Pré-requis

Les logiciels suivant doivent être installés sur la machine hôte :

- [Cookiecutter](https://github.com/cookiecutter/cookiecutter)
- [Github CLI](https://cli.github.com/)

## Présentation

### Principales fonctionnalités

- Génération d'une application composé de conteneurs [Docker](https://www.docker.com) pilotés par [Docker Compose](https://code.visualstudio.com/docs/remote/containers) et [GNU/Make](https://www.gnu.org/software/make/)
- Initialisation des dépôts Git locaux et distants (optionnellement, sur [Github](https://github.com))
- Compatibilité avec [Visual Studio Code Remote Containers](https://code.visualstudio.com/docs/remote/containers)
- Mise à disposition dynamique des services publics à travers un proxy [Traefik](https://docs.traefik.io/)
- Notification optionnelle de la création du dépôt dans un salon [Rocket Chat](https://rocket.chat/)
- Mise à disposition d'outils de maintenance et de surveillance

### Services

#### Application

- `apache` : Image Docker basée sur l'image [php:apache](https://hub.docker.com/layers/php/library/php/7.4.8-apache/images/sha256-d64789a928c6ff660e94567ad044aec6dded6a5b2cc60ee6f131ae50b1b6d53a?context=explore). Elle embarque les sources de l'application
- `db` : Serveur des bases de données de l'application

#### Outils de maintenance et surveillance

- [`adminer`](https://www.adminer.org) : Interface graphique de gestion des bases de données du service `db`
- [`portainer`](https://www.portainer.io) : Interface graphique de gestion du serveur Docker
- [`traefik`](https://www.traefik.io) : Routeur HTTP et TCP. Point d'entrée vers les différents services de l'applications

## Utilisation

### Création d'un nouveau projet à partir du squelette

```sh
cookiecutter https://github.com/kobischE/skel.git
```

#### Paramètres

- **`docker_repository`**

    - Chemin vers un dépôt d'images Docker
    - par défaut : `docker.io/{{ github_owner }}`

- **`git_remote_skel`**

    - URL du dépot Git hébergeant les sources du squelette
    - par défaut : `git@github.com:{{ github_owner }}/skel.git`

- **`github_create_repo`**

    - Si `true` un dépôt distant est créé sur Github et les sources initiales du projet y sont ajoutées
    - par défaut : `false`

- **`github_owner`**

    - Identifiant d'un utilisateur ou d'une organisation Github

- **`project_name`**

    - Le nom complet du projet
    - par défaut : `Un projet sacrément prometteur`

- **`project_slug`**

    - L'identifiant textuel du projet
    - par défaut : `{{ project_name.lower().replace(' ', '-').replace('\\'', '-') }}`

- **`rocketchat_hook_url`**

    - URL vers un [webhook Rocket Chat entrant](https://docs.rocket.chat/guides/administrator-guides/integrations)
    - par défaut : `https://discutons.incongru.org/hooks/wd9Tfwof78pqb6i94/KagGAhiBA6KyWnSXFqJRXCbgqLp599G35gvPWnBPSTt7pMsc

## Développement

### Exécution de la suite de tests

```sh
make test
```

###  Démarrage

```sh
make start
```
### Arrêt

```sh
make stop
```
### Info et urls 

```sh
make help
```

Détails dans Makefile


