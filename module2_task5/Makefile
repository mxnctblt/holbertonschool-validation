build: ## execute the Go-Hugo and Golang builds
	make go-build
	make hugo-build
go-build: ## compile the source code of the application to a binary
	go build main.go
	mv main awesome-api || true
hugo-build: ## Generate the website
	hugo
post: ## Create a new blog post
	hugo new posts/$(POST_NAME).md
	sed -i '/title:/c\title: "$(POST_TITLE)"' content/posts/$(POST_NAME).md
run: ## Run the application in background and write logs into a file
	make build
	./awesome-api >./awesome-api.log 2>&1 &
	echo 'HIT: healtcheck' >> awesome-api.log
stop: ## Stop the application with the command kill
	pkill awesome-api
check: ## Lint of the Markdown source files & Analysis of the links
	markdownlint ./content/posts/*.md && markdown-link-check ./content/posts/*.md
clean: ## Stop the application. Delete the binary and the log file
	make stop || true
	rm awesome-api awesome-api.log || true
	rm coverage-units.out coverage-integrations.out || true
	rm -rf dist/ || true
test: ## To test it to ensure that it behaves as expected
	make integration-tests
	make unit-tests
	make validate
lint: ## lint the source code
	golangci-lint run
unit-tests:	## Unit-tests:
	go test -v -short -coverprofile=coverage-units.out
integration-tests:  ## Integrations-tests
	go test -v -coverprofile=coverage-integrations.out
validate: ## validate the file ./dist/index.htm
	python3 /opt/W3C-Validator/w3c_validator.py ./dist/index.html || true
help: ## Show this help
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'
