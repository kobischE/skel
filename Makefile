GITHUB_ORG := $${USERNAME}
GITHUB_USERNAME := $${USERNAME}
PROJECT_SLUG := $$(date +"%s")

test:
	cookiecutter \
		--no-input \
		--output-dir ./tests \
		. \
		git_remote=$$(git config --get remote.origin.url) \
		github_org=$(GITHUB_ORG) \
		github_username=$(GITHUB_USERNAME) \
		project_slug=$(PROJECT_SLUG)
