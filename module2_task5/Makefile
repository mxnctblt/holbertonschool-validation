build: ## compile the source code of the application to a binary name
	golangci-lint run
	go build
	hugo
run: ## Run the application in background by executing the binary awesome-api
	./awesome-api >./awesome-api.log 2>&1 &
stop: ## Stop the application with the command kill XXXXX where XXXXX is the Process ID of the application
	pkill awesome-api || true
clean: ## Stop the application. Delete the binary awesome-api and the log file awesome-api.log
	pkill awesome-api || true
	rm -f awesome-api awesome-api.log coverage-*
	rm -rf dist/*
test: ## execute all the tests
	go test -v -short -coverprofile=coverage-units.out
	go test -v -coverprofile=coverage-integrations.out
post: ## Create a new blog post whose filename and title come from the environment variables POST_TITLE and POST_NAME
	hugo new posts/$(POST_NAME).md
	sed -i 's/title:.*/title:"$(POST_TITLE)"/' content/posts/$(POST_NAME).md
lint: ## Fail when the linter catches and error
	golingci-lint run
check: ## Succeed by default, and fail when presented with a dead link or a badly written Markdown file
	markdownlint README.md content/posts/*
	markdown-link-check README.md content/posts/*
validate: ## Always succeed by default and should print the result on the stdout 
	python3 /opt/W3C-Validator/w3c_validator.py ./dist/index.html || true
unit-tests: ## the Golang unit tests
	go test -v -short -coverprofile=coverage-units.out
integration-tests: ## the integration tests
	go test -v -coverprofile=coverage-integrations.out
help: ## show this help
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'
