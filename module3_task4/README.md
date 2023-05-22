# 4. Safer Collaboration with Pull Requests

## Prerequisites

- Same requirements as the previous module:
    - A valid Hugo website
    - Makefile with the same targets, including help
    - Documentation (README.md , DEPLOY.mdand Makefile) is up-to-date with the project state
- The files .github/workflows/module3_task4.yml and .github/workflows/release_drafter.yml must be present, valid GitHub action workflows and linked to the current task’s directory:
```
➜ test -L release_drafter.yml && readlink release_drafter.yml
../.github/workflows/release_drafter.yml
➜ test -L github-workflow.yml && readlink github-workflow.yml
../.github/workflows/module3_task4.yml
```
- The workflow named module3_task4 should behave the same as the previous workflow except that it is also triggered by pull requests.
```
➜ curl --silent --show-error --user "${GH_USERNAME}:${GH_TOKEN}" "https://api.github.com/repos/${GH_USERNAME}/${GH_REPO}/actions/runs" | jq '.workflow_runs[0] | .name, .head_branch, .conclusion'
"module3_task4"
"main"
"success"
```
- Opening a pull request with a breaking change should fail the workflow, and a valid change should succeed the workflow.

- A new release 1.0.1 must be created with at least 1 change from a merged Pull Request with:
    - The files awesome-website.zip and DEPLOY.md attached to the release
    - The content of the release"s body should be generated by release_drafter

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

- package: creates a zip archive of the the latest build and stores it under awesome-website.zip

- help: Display help message.

## Workflow
-  The original workflow file <...>/.github/workflows/module3_task4.yml must be:
   -  Present with a valid YAML syntax
   -  It must be a valid GitHub action workflow with 1 job and 1 steps
   -  It must be have 2 triggers