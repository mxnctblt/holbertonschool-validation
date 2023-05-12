# 3. Integration Tests with Golang

Let’s work on the integration tests by updating the build process:

- Add a new target to execute the Integration tests using the command go test <flags>
    - The coverage report should be written in a file named coverage-integrations.out
    - No unit test are expected to be run with this new target
- Add new integration test cases in main_integration_test.go to cover all the instructions of the 3 functions included in the SUT (setupRouter(), HelloHandler() and HealthCheckHandler()).
- Modify the existing test target: it should run both Unit Tests and Integration Tests instead of the curl commands
- Modify the existing clean target so that it also removes the coverage report

## Prerequisites :
- As per the previous modules:
    - A Makefile should be present and valid
    - The binary awesome-api must NOT exist at the beginning, in the source code
    - The goals build, run , stop, clean, help, lint and unit-tests should be the same as before
    - A README.md file should exist
- The goal integration-tests should be implemented and should execute (successfully) the Golang integration tests:
```
➜ make integration-tests
# ...
PASS
coverage: XX.X% of statements
ok      <project>        Y.YYYs
```
- The file main_integration_test.go must be added with the provided code, and 2 test cases must be added in order to cover more instructions than the default
```
➜ grep Test_server main_integration_test.go
func Test_server(t *testing.T) {
➜ ls -1 ./coverage-integrations.out ./coverage-units.out
ls: ./coverage-integrations.out: No such file or directory
ls: ./coverage-units.out: No such file or directory
➜ make integration-tests | grep RUN
Y # Y must be greater than 3
➜ ls -1 ./coverage-integrations.out ./coverage-units.out
./coverage-integrations.out
ls: ./coverage-units.out: No such file or directory
➜ go tool cover -func=coverage-integrations.out | grep 100.0 | awk '{print $2}'
setupRouter
HealthCheckHandler
HelloHandler
```
- The goal test and clean must be updated:
```
➜ ls -1 ./coverage-integrations.out ./coverage-units.out
ls: ./coverage-integrations.out: No such file or directory
ls: ./coverage-units.out: No such file or directory
➜ make test | grep -c PASS
Z # Where Z is greater than 8
➜ ls -1 ./coverage-integrations.out ./coverage-units.out
./coverage-integrations.out
./coverage-units.out
➜ make clean
➜ ls -1 ./coverage-integrations.out ./coverage-units.out
ls: ./coverage-integrations.out: No such file or directory
ls: ./coverage-units.out: No such file or directory
```
- The documentation (both README.md file and make help command) must be up to date with these new commands

## Lifecycle :
    “build”: compile the source code of the application to a binary named awesome-api (the name awesome-api comes from the command go mod init github.com/<your github handle>/awesome-api) with the command go build.
    “run”: Run the application in background by executing the binary awesome-api, and write logs into a file named awesome-api.log with the command ./awesome-api >./awesome-api.log 2>&1 &.
    “stop”: Stop the application with the command kill XXXXX where XXXXX is the Process ID of the application. For instance: pkill awesome-api.
    “clean”: Stop the application. Delete the binary awesome-api and the log file awesome-api.log.
    “test”: You want to test it to ensure that it behaves as expected. With the application started, you may want to use the command line curl (or your web browser, or the command wget or any other HTTP client).
    “lint”: The goal lint should be implemented and should fail when the linter catches and error.
    “help”: Show help for all command.
    “unit-tests”: should be implemented and should execute (successfully) the Golang unit tests.
    “integration-tests”: should be implemented and should execute (successfully) the Golang integration tests.