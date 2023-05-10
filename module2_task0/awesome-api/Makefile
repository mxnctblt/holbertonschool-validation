build: ## compile the source code of the application to a binary
	go build main.go
run: ## Run the application in background and write logs into a file
	./awesome-api >./awesome-api.log 2>&1 &
stop: ## Stop the application with the command kill
	kill "$(pgrep awesome-api)"
clean: ## Stop the application. Delete the binary and the log file
	kill "$(pgrep awesome-api)"
	rm awesome-api awesome-api.log
test: ## To test it to ensure that it behaves as expected
	curl http://localhost:9999
	curl http://localhost:9999/health
help: ## Show this help
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'
