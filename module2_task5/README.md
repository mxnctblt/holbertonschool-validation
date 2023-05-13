# 5. Avengers Assemble: Putting All The Bricks Together

## Prerequisites :

- Same requirements as the previous task:

    - A Valid Go-Hugo website is provided
    - There are no Git Submodules
    - The theme ananke is installed
    - Makefile exists and is not empty

- The binary awesome-api and the directory ./dist must NOT exist at the beginning, in the source code

- A README.md file should exist, documenting the targets and requirements

- A Makefile should be present and valid

    - The target build should generate both the static website with ./dist/ and the API application
    - The target run should start the service in background so that http://localhost:9999/posts/welcome/ is reachable
    - The target stop should stop the service started by make run
    - The target help should list all the targets with their help message
    - The target lint should execute all of the lint steps
    - The target post should add a new post
    - The target test should execute all of the testing targets (unit-tests, integration-tests and validate)
    - The target clean should delete all the generated files (logs, test reports, distribution directory, etc.) and call the make stop target as preliminary
```
➜ ls -1 ./coverage-integration.out ./coverage-unit.out ./dist/ ./awesome-api
ls: ./coverage-integration.out: No such file or directory
ls: ./coverage-units.out: No such file or directory
# ...
➜ make run
# Run lint, build, tests and start the application
➜ curl http://localhost:9999/healthcheck
ALIVE
➜ make clean
➜ curl http://localhost:9999/healthcheck
curl: (7) Failed to connect to localhost port 9999: Connection refused
```
## Lifecycle :
   - "build": generate both the static website with ./dist/ and the API application
   - "run": start the service in background so that http://localhost:9999/posts/welcome/ is reachable
   - "stop": stop the service started by make run
   - "help": list all the targets with their help message
   - "lint": execute all of the lint steps
   - "post": add a new post
   - "test": execute all of the testing targets (unit-tests, integration-tests and validate)
   - "clean": delete all the generated files (logs, test reports, distribution directory, etc.) and call the make stop target as preliminary