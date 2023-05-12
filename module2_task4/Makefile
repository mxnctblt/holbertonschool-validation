build: ## Generate the website
	make check
	hugo || true
clean: ## Cleanup the content of the directory dist/
	rm -rf dist/ || true
post: ## Create a new blog post
	hugo new posts/$(POST_NAME).md
	sed -i '/title:/c\title: "$(POST_TITLE)"' content/posts/$(POST_NAME).md
help: ## Show this help
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'
check: ## Lint of the Markdown source files & Analysis of the links
	markdownlint ./module2_task4 && markdown-link-check ./module2_task4 || true
validate: ## validate the file ./dist/index.htm
	python3 /opt/W3C-Validator/w3c_validator.py ./dist/index.html || true
