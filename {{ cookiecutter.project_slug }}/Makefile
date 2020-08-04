# Commandes publiques

help: ## Affichage de ce message d'aide
	@printf "\033[36m%s\033[0m (v%s)\n\n" $$(basename $$(pwd)) $$(git describe --tags --always)
	@echo "Commandes disponibles\n"
	@for MKFILE in $(MAKEFILE_LIST); do \
		grep -E '^[a-zA-Z0-9\._-]+:.*?## .*$$' $$MKFILE | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m  %-30s\033[0m  %s\n", $$1, $$2}'; \
	done
	@echo ""
	@$(MAKE) --no-print-directory urls

start: portainer-rm clear-ports ## Démarrage de l'application
	docker-compose up --build --remove-orphans -d

stop: ## Arrêt de l'application
	docker-compose stop

clean: stop ## Suppression des conteneurs. Les volumes sont conservés.
	docker-compose rm -f

# Commandes privées

clear-ports: # Arrêt des services utilisant le port 8080
	@for CONTAINER_ID in $$(docker ps --filter=expose=80 -q); do \
		if docker port $${CONTAINER_ID} | grep 80; then \
			docker stop $${CONTAINER_ID}; \
		fi; \
	done

portainer-rm: # Suppression d'instances de Portainer existantes
	-docker rm -f portainer

urls: # Affichage de la liste des URL publiques
	@echo "URL publiques"
	@echo
	@echo "  Application"
	@echo
	@echo "    \033[36mPage d'accueil\033[0m : http://{{ cookiecutter.project_slug }}.localhost"
	@echo
	@echo "  Outils"
	@echo
	@echo "    \033[36mAdminer\033[0m : http://adminer.{{ cookiecutter.project_slug }}.localhost"
	@echo "    \033[36mPortainer\033[0m : http://portainer.{{ cookiecutter.project_slug }}.localhost"
	@echo "    \033[36mTraefik\033[0m : http://traefik.{{ cookiecutter.project_slug }}.localhost"
	@echo