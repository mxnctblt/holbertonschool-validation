<h1 align="center">Continuous Integration / Continuous Deployment


## Learning Objectives
This project aims at practicing with Continuous Integration (CI) / Delivery (CD) / Deployment to understand the differences, the goals and the value.

After this project, you should be able to:
- Implement Continuous Integration workflows using GitHub Actions
- Tell if a given GitHub Action’s workflow is about Continuous Integration (CI), or Continuous Delivery (CD) or Continuous Deployment (skill of context analysis)
- Understand the challenges of build reproductibility, through management of build dependencies using APT packages, NPM, Python3’s pip, and direct binary downloads.
- Build collaboratively a Software Delivery Pipeline and produce released artifacts, including documenting the changes and the usage
- Continuously deploy a static web site to Netlify

## Prerequisites
### Concepts
You should have a basic knowledge of the following concepts:
- What is and how to use git tags
- Basics of what is and how to use a GitHub “Release”
- What is and how to create/use a ZIP archive
- Know how to write a valid YAML file

### Tooling

This project needs the following tools / services:

- An HTML5-compliant web browser (Firefox, Chrome, Opera, Safari, Edge, etc.)
- A free account on [GitHub](https://github.com/), referenced as `GitHub Handle`
- A shell terminal with bash, zsh or ksh, including the standard Unix toolset (ls, cd, etc.)
- [GNU](https://www.gnu.org/software/make/) Make in version 3.81+
- [Git](https://git-scm.com/book/en/v2/Getting-Started-The-Command-Line) (command line) in version 2+
- [Go Hugo](https://gohugo.io/) v0.84+
- [Golang](https://intranet.hbtn.io/rltoken/5ypbIenKj6LiymRm619--A) v1.15.*
- [NPM](https://intranet.hbtn.io/rltoken/RcU82lwHHO4xEQCtWEv1sg)v7 + [NodeJS](https://intranet.hbtn.io/rltoken/XWIqoQhjv16uVWfGbCdInw) v14.*
- [markdownlint-cli](https://intranet.hbtn.io/rltoken/hplwMW8M8BKVQyhDso0pOw) v0.26.0
- [markdown-link-check](https://intranet.hbtn.io/rltoken/BRJGBHXvkAUKt50KrFOm0A) v3.8.6
- [Holberton's W3C Validator](https://intranet.hbtn.io/rltoken/ll8gJ8CPoI9tfn1OTDE8rA)
- [yq](https://intranet.hbtn.io/rltoken/9wlxJjlqCE6XyPa6TQ0RsQ) v4.5.0
- [shellcheck](https://intranet.hbtn.io/rltoken/7e95a2wDfOHFQGKJqRlHgg) v0.*
- [yamllint](https://intranet.hbtn.io/rltoken/B1BZ_C_5ANyq005Vd0LWNw) v1.*
- [jq](https://intranet.hbtn.io/rltoken/pVjsOvuSQavip_1Y4u--4Q) v1.*

## Workflow
* Workflow release_drafter :
-> Generate a changelog based on the merged Pull Request’s titles, since the previous release
-> Write this changelog in a “draft GitHub Release”
-> Be linked into the current task’s directory (same pattern as the github-workflow.yml file)
-> Be configured through the default .github/release_drafter.yml
-> Runs on ubuntu-22.04

* Workflow module3_task5 :
-> A new step “deploy”, based on the “nwtgck/actions-netlify” Action, is run as the last workflow’s step
-> When the workflow is triggered by a Pull Request, the deploy step is done on a preview site.
-> When the workflow is triggered on the principal branch, then it is deploy to production

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