build: ## compile the source code of the application to a binary
	make lint
	go build main.go
	mv main awesome-api || true
run: ## Run the application in background and write logs into a file
	./awesome-api >./awesome-api.log 2>&1 &
	echo 'HIT: healtcheck' >> awesome-api.log
stop: ## Stop the application with the command kill
	pkill awesome-api
clean: ## Stop the application. Delete the binary and the log file
	pkill awesome-api || true
	rm awesome-api awesome-api.log || true
test: ## To test it to ensure that it behaves as expected
	curl http://localhost:9999
	curl http://localhost:9999/health
lint: ## lint the source code
	golangci-lint run
unit-tests:	## Unit-tests:
	go test -v -short -coverprofile=coverage-units.out
help: ## Show this help
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'
