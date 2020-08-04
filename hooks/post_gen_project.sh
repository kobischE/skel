#!/bin/sh

# On arrête l'exécution en cas d'erreur
set -ex

# Création du dépôt local
git init
git add .
git commit -m "Initialisation du projet
À partir du squelette : {{ cookiecutter.skel_url }}"

if {{ cookiecutter.github_create_repo }}; then
    # Création du dépôt Github
    gh repo create {{ cookiecutter.github_org }}/{{ cookiecutter.project_slug }} --public

    # Déploiement des modifications
    git push -u origin master

    # Notification Rocket Chat
    curl \
        -X POST \
        -H 'Content-Type: application/json' \
        --data '{"alias":"Skel","avatar":"https://i.imgur.com/adBSucj.jpg","text":"Un nouveau dépôt a été créé !","attachments":[{"title":"{{ cookiecutter.github_org }}/{{ cookiecutter.project_slug }}","title_link":"https://github.com/{{ cookiecutter.github_org }}/{{ cookiecutter.project_slug }}","text":"Project Github : https://github.com/{{ cookiecutter.github_org }}/{{ cookiecutter.project_slug }}\nSquelette : {{ cookiecutter.skel_url }}\nCréé par : https://github.com/{{ cookiecutter.github_username }}" }]}' \
        {{ cookiecutter.rocketchat_hook_url }}
fi

# Démarrage du projet
make start help