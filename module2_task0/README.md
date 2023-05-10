# 0. Build an Application using Make

This HTTP webserver is expected to listen to incoming HTTP requests on localhost:9999:

- If a request hits the path / (e.g. http://localhost:9999/ or http://localhost:9999) then you expect a 404 Not Found (the homepage is not implemented in this task)
- If a request hits the path /health (e.g. http://localhost:9999/health) then you expect the server to answer ALIVE if it is up and running

## Prerequisites
You are expected to write a Makefile to automate the life-cycle of this application:

- A Makefile should be present and valid
- The binary awesome-api must NOT exist at the beginning, in the source code
- The goals build, run , stop, clean test should be implemented and mapped to the life-cycle stages of the same name:
```
➜ ls -1 ./awesome-api ./awesome-api.log
ls: ./awesome-api: No such file or directory
ls: ./awesome-api.log: No such file or directory

➜ make build
➜ ls -1 ./awesome-api ./awesome-api.log
ls: ./awesome-api.log: No such file or directory
./awesome-api

➜ make test
# ...
curl: (7) Failed to connect to localhost port 9999: Connection refused
# ...
curl: (7) Failed to connect to localhost port 9999: Connection refused

➜ make run
➜ ls -1 ./awesome-api ./awesome-api.log
./awesome-api
./awesome-api.log
➜ cat ./awesome-api.log
HTTP Server listening on localhost:9999

➜ make test
# ...
404 page not found
# ...
ALIVE
➜ cat ./awesome-api.log
HTTP Server listening on localhost:9999
HIT: healtcheck

➜ make stop
➜ make test
# ...
curl: (7) Failed to connect to localhost port 9999: Connection refused
# ...
curl: (7) Failed to connect to localhost port 9999: Connection refused

➜ make clean
➜ ls -1 ./awesome-api ./awesome.log
ls: ./awesome-api: No such file or directory
ls: ./awesome-api.log: No such file or directory
```

The goal make help must be implemented and print a list of all the goals with a sentence each:
```
➜ make help
help: ...
build: ...
clean: ...
run: ....
```
## Lifecycle

- Commands created:
    - build
    - clean
    - run
    - stop
    - test
    - help