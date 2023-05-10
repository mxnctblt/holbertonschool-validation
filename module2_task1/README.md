# 0. Build an Application using Make

For this exercise, you have to:

Add a new step to our process to lint the source code: you do not want to build the application if the lint fails.
And of course fix the code by changing the line io.WriteString(w, "ALIVE") to _, _ = io.WriteString(w, "ALIVE") in main.go

## Prerequisites
- As per the previous module:
    - A Makefile should be present and valid
    - The binary awesome-api must NOT exist at the beginning, in the source code
    - The goals build, run , stop, clean, help and test should be the same as before
    - A README.md file should exist
- The goal lint should be implemented and should fail when the linter catches and error:
```
# Bad code
➜ grep WriteString ./main.go
io.WriteString(w, "ALIVE")

➜ make lint >/dev/null 2>&1 && echo "OK" || echo "ERROR"
ERROR

## Fix the code in your editor

# Fixed code
➜ grep WriteString ./main.go
_, _ = io.WriteString(w, "ALIVE")

➜ make lint >/dev/null 2>&1 && echo "OK" || echo "ERROR"
OK
```
- The goal lint must always be called before the goal build, to avoid compiling the code if the linter fails:
```
# Bad code
➜ grep WriteString ./main.go
io.WriteString(w, "ALIVE")

➜ make build >/dev/null 2>&1 && echo "OK" || echo "ERROR"
ERROR

## Fix the code in your editor

# Fixed code
➜ grep WriteString ./main.go
_, _ = io.WriteString(w, "ALIVE")

➜ make build >/dev/null 2>&1 && echo "OK" || echo "ERROR"
OK
```
## Lifecycle

- Commands created:
    - build
    - clean
    - run
    - stop
    - test
    - help
    - lint