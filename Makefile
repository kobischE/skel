GITHUB_OWNER := $${USERNAME}
PROJECT_SLUG := $$(date +"%s")

# Commandes publiques

help: ## Affichage de ce message d'aide
	@printf "\033[36m%s\033[0m (v%s)\n\n" $$(basename $$(pwd)) $$(git describe --tags --always)
	@echo "Commandes disponibles\n"
	@for MKFILE in $(MAKEFILE_LIST); do \
		grep -E '^[a-zA-Z0-9\._-]+:.*?## .*$$' $$MKFILE | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m  %-30s\033[0m  %s\n", $$1, $$2}'; \
	done
	@echo

test: ## Création d'un projet à partir des sources locales du squelette
	cookiecutter \
		--output-dir ./tests \
		. \
		git_remote=$$(git config --get remote.origin.url) \
		github_owner=$(GITHUB_OWNER) \
		project_name=$(PROJECT_SLUG)
