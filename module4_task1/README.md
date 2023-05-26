<h1 align="center"> Creating Applications in Containers with Docker

## Learning Objectives

This project aims at understanding the benefits of Docker by going over problems it solves.

After this project, you should be able to:
- Learn to create, deploy, and run applications via Docker containers.
- Build and test software as part of a CI/CD pipeline, using Docker.

## Prerequisites

### Concepts
You should have a basic knowledge of the following concepts:
- Understand the basics of a [Docker Container](https://docs.docker.com/get-started/)

### Tooling
This project needs the following tools / services:
- [Docker](https://www.docker.com/get-started/) should be installed on your machine. If you cannot use Docker, then you can use the website [https://labs.play-with-docker.com/](https://labs.play-with-docker.com/).

### Story
Now that your teams are using CI/CD, you would like to solve the “reproducibility” challenge for both the build environment and the production environment.

While it’s not the only way of doing it, Docker would be a great tool for solving these challenges.

# 1. Building With A Custom Docker Image

## Lifecycle

- build: compile the source code of the application to a binary named awesome-api (the name awesome-api comes from the command go mod init github.com/<your github handle>/awesome-api) with the command go build. The first build may takes some times.

- run: Run the application in background by executing the binary awesome-api, and write logs into a file named awesome-api.log with the command ./awesome-api >./awesome-api.log 2>&1 &.

- stop: Stop the application with the command kill XXXXX where XXXXX is the Process ID of the application. For instance: kill "$(pgrep awesome-api)".

- post: Create a new blog post whose filename and title come from the environment variables POST_TITLE and POST_NAME

- clean: Stop the application. Delete the binary awesome-api and the log file awesome-api.log

- test: You want to test it to ensure that it behaves as expected.

- unit-tests: Run unit tests.

- integration-tests: Run integration tests.

- lint: Lint go lang code.

- check: Lint markdonw source, check dead links.

- validate: Validate the file dist/index.html using the command line Holberton’s W3C Validator.

- help: Display help message.

## Workflow
-  The original workflow file <...>/.github/workflows/module4_task1.yml must be:
   -  Present with a valid YAML syntax
