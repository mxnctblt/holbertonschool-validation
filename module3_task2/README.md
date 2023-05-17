# 2. Earlier Feedback with Continuous Delivery

## Prerequisites

- Same requirement as the previous module:
    - A valid Hugo website
    - Makefile with the same targets, including help
    - Documentation (README.md and Makefile) is up-to-date with the project state

- The file DEPLOY.md exists and is not empty. It describes the 4 points described earlier.

- The target package must be implemented and documented. It should create a file named awesome-website.zip (not committed and deleted by make clean).

- The target lint should be updated to lint the files README.md and DEPLOY.md with markdownlint command line

- The file .github/workflows/module3_task2.yml must be present
    - It must be valid in YAML syntax
    - It must be a valid GitHub action workflow with 1 job with at least 7 steps
    - It must be have 2 triggers

- The workflow “module3_task2” should:
    - Always run the make target package
    - Archive the generated package only on the principal branch
    - be enabled in GitHub Actions and must have been run successfully
```
➜ curl --silent --show-error --user "${GH_USERNAME}:${GH_TOKEN}" "https://api.github.com/repos/${GH_USERNAME}/${GH_REPO}/actions/runs" | jq '.workflow_runs[0] | .name, .head_branch, .conclusion'
"module3_task2"
"main"
"success"`
```

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

- package: Create a zip file containing the awesome-api binary and the dist/ directory

## Workflow
-  The original workflow file <...>/.github/workflows/module3_task2.yml must be:
   -  Present with a valid YAML syntax
   -  It must be a valid GitHub action workflow with 1 job and 1 steps
   -  It must be have 2 triggers