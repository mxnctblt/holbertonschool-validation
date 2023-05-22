.POSIX:
DESTDIR=dist
HUGO_VERSION=0.84.0

.PHONY: build
build:		## update Hugo version & Build a new website in the directory /dist 
	@hugo -c $(DESTDIR)

.PHONY: clean
clean:		## Removes all files from the directory /dist
	rm -Rf $(DESTDIR)/*
	rm -f ./awesome-website.zip

.PHONY: post
post:		## Post a new blog post 
	hugo new posts/$(POST_NAME).md
	sed -i 's/title:.*/title: "$(POST_TITLE)"/' content/posts/$(POST_NAME).md
	
.PHONY: help
help: 		## Show this help
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

.PHONY: check
check: 		## check the markdown's lint
	@markdownlint -f ./content/posts/*.md && markdown-link-check ./content/posts/*.md

.PHONY: validate
validate:  	## validate W3C
	@git clone https://github.com/holbertonschool/W3C-Validator.git
	@python3 /opt/W3C-Validator/w3c_validator.py ./dist/index.html || true

.PHONY: run
run: 		## runs the api and logs it
	./awesome-api > ./awesome-api.log 2>&1 &

.PHONY: stop
stop: 		## kills the process with PID name
	pkill awesome-api

.PHONY: test 
test:	 	## run tests
	@make unit-tests 
	@make integration-tests

.PHONY: unit-tests
unit-tests: ## run unit tests
	@go test -v -short -coverprofile=coverage-units.out

.PHONY: integration-tests
integration-tests:	## run integration tests
	@go test -v -coverprofile=coverage-integrations.out

.PHONY: package
package: 	## produce a file awesome-website.zip 
	zip -r awesome-website.zip awesome-api dist/*

.PHONY: lint
lint:		## lint the files
	@markdownlint -f ./module3_task4/README.md ./module3_task4/DEPLOY.md

