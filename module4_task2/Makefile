GO=go
TARGET=awesome-api
RM=rm -rf
MAKE=make
COVERAGE=coverage
HUGO=hugo

# docker run <option> 
# --rm :tells the container to be removed after it finishes
# $(PWD):/app current folder would be bound to the containers /app folder
# -w work directory

build:	## Generate the source code of the application to a binary.
	make lint
	docker run --rm -v $(PWD):/app -w /app awesome:build go mod tidy
	docker run --rm -v $(PWD):/app -w /app awesome:build hugo
	docker run --rm -v $(PWD):/app -w /app awesome:build go build -o $(TARGET)

build-docker:	## Build docker image awesome:build
	docker build -t awesome:build -f .build/Dockerfile .

docker-tests:   ## Test docker image awesome:build
	docker run --rm -v $(PWD):/app -v /var/run/docker.sock:/var/run/docker.sock -w /app awesome:build container-structure-test test --image awesome:build --config .build/cst.yml

run:	## Run the application in background by executing the binary.
	./$(TARGET) >./$(TARGET).log 2>&1 &

post:	## Create a new blog post whose filename and title come from the environment variables POST_TITLE and POST_NAME
	$(HUGO) new posts/$(POST_NAME).md
	sed -i '2s/.*/title: "$(POST_TITLE)"/' content/posts/$(POST_NAME).md

stop:	## Stop the application.
	@pkill $(TARGET)

clean:	## Stop the application. Delete the binary and the log file.
	@sudo $(RM) $(TARGET) $(TARGET).log $(COVERAGE)-units.out $(COVERAGE)-integrations.out dist/ *~

test:	## Test the application.
	$(MAKE) unit-tests
	$(MAKE) integration-tests
	$(MAKE) validate

unit-tests: ## Run unit tests
	docker run --rm --volume=$(shell pwd):/app --workdir=/app awesome:build apk add --no-cache build-base && go test -v -short -coverprofile=coverage-units.out



integration-tests: ## Run integration tests
	docker run --rm --volume=$(shell pwd):/app --workdir=/app awesome:build apk add --no-cache build-base && go test -v -coverprofile=coverage-integrations.out


lint:	## Lint go markdown code
	make build-docker
	docker container run --rm -i hadolint/hadolint < .build/Dockerfile
	docker run --volume=$(shell pwd):/app --workdir=/app awesome:build markdownlint -f DEPLOY.md

check:	## Lint markdonw source, check dead links
	markdownlint ./content/posts/*.md
	find content -name \*.md -print0 | xargs -0 -n1 markdown-link-check

validate:	## Validate the file dist/index.html using the command line Holberton’s W3C Validator.
	docker run awesome:build sh -c "python3 ./w3c_validator.py ./dist/index.html || true"

package:	## Produce awesome-website.zip containing awesome-api and dist directory
	zip -FSr awesome-website.zip awesome-api dist

help:	## Show this help usage.
	@sed -ne '/@sed/!s/## //p' $(MAKEFILE_LIST)
