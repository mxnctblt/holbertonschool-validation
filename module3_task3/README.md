# 3. Automate Releases with Git Tags and GitHub Releases

## Prerequisites

- Same requirements as the previous module:
    - A valid Hugo website
    - Makefile with the same targets, including help
    - Documentation (README.md , DEPLOY.mdand Makefile) is up-to-date with the project state
- The file .github/workflows/module3_task3.yml must be present
    - It must be valid in YAML syntax
    - It must be a valid GitHub action workflow
- The workflow “module3_task3” should:
    - Generate an archive when triggered by a tag
    - Create a release with the archive and content of DEPLOY.md when triggered by a tag
    - Behave the same as “module3_task2” when triggered by something else than a tag (e.g. archive without version name, and no release)
    - Be enabled in GitHub Actions and must have been run successfully with a tag 1.0.0
```
➜ curl --silent --show-error --user "${GH_USERNAME}:${GH_TOKEN}" "https://api.github.com/repos/${GH_USERNAME}/${GH_REPO}/actions/runs" | jq '.workflow_runs[0] | .name, .head_branch, .conclusion'
"module3_task3"
"main"
"success"
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

- package: creates a zip archive of the the latest build and stores it under awesome-website.zip

- help: Display help message.

## Workflow
-  The original workflow file <...>/.github/workflows/module3_task3.yml must be:
   -  Present with a valid YAML syntax
   -  It must be a valid GitHub action workflow with 1 job and 1 steps
   -  It must be have 2 triggers
