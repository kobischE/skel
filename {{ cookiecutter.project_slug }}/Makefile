help: ## Affiche ce message d'aide
	@for MKFILE in $(MAKEFILE_LIST); do \
		grep -E '^[a-zA-Z0-9\._-]+:.*?## .*$$' $$MKFILE | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'; \
	done
	@$(MAKE) urls

start: ## demarrer
	docker-compose up --build -d

stop: ## arrêter				
	docker-compose stop

clean: stop ## supprimer
	docker-compose rm -f

portainer: portainer-rm ## lancer portainer
	docker run -d -p 8000:8000 -p 9000:9000 --name=portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer

portainer-open: portainer ## ouvrir portainer dans le navigateur	
	sleep 3 
	browse http://localhost:9000/#/home

portainer-rm: ## supprimer portainer
	docker rm -f portainer

urls: ## Affichage des URL publiques du projet
	@echo "URL publiques:"
	@echo "  Adminer : http://adminer.{{ cookiecutter.project_slug }}.localhost"
	@echo "  Page d'accueil : http://php.{{ cookiecutter.project_slug }}.localhost"
