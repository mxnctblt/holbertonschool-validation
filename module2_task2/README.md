# 2. Unit Tests with Code Coverage

The goal of this exercise is to add a set of unit tests to ensure that the function HelloHandler() conforms to the expected behavior.

## Prerequisites :
- As per the previous modules:
    - A Makefile should be present and valid
    - The binary awesome-api must NOT exist at the beginning, in the source code
    - The goals build, run , stop, clean, help, lint and test should be the same as before
    - A README.md file should exist
- The file main.go must be updated to implement the new behavior with the code provided earlier
- The goal unit-tests should be implemented and should execute (successfully) the Golang unit tests:
```
➜ make unit-tests
# ...
PASS
coverage: XX.X% of statements
ok      <project>        Y.YYYs
```
- The file main_test.go must be added with the provided code, and test cases must be added in order to cover all the instructions from the function HelloHandler()
```
➜ grep Test_HelloHandler ./main_test.go
func Test_HelloHandler(t *testing.T) {
➜ ls -1 ./coverage-units.out
ls: ./coverage-units.out: No such file or directory
➜ make unit-tests | grep RUN
X # X must be greater than 3
➜ go tool cover -func=coverage-units.out | grep HelloHandler | awk '{print $3}'
100.0%
```

## Lifecycle :
    “build”: compile the source code of the application to a binary named awesome-api (the name awesome-api comes from the command go mod init github.com/<your github handle>/awesome-api) with the command go build.
    “run”: Run the application in background by executing the binary awesome-api, and write logs into a file named awesome-api.log with the command ./awesome-api >./awesome-api.log 2>&1 &.
    “stop”: Stop the application with the command kill XXXXX where XXXXX is the Process ID of the application. For instance: pkill awesome-api.
    “clean”: Stop the application. Delete the binary awesome-api and the log file awesome-api.log.
    “test”: You want to test it to ensure that it behaves as expected. With the application started, you may want to use the command line curl (or your web browser, or the command wget or any other HTTP client).
    “lint”: The goal lint should be implemented and should fail when the linter catches and error.
    “help”: Show help for all command.
    “unit-tests”: should be implemented and should execute (successfully) the Golang unit tests.