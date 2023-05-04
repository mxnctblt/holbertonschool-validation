# 1. Development Lifecycle with Makefile

In the DevOps methodology, while tools often change, the “development” lifecycle is generally staying the same. In this project, you will start to define this lifecycle via the following steps:
- “build”: Generate the website from the markdown and configuration files in the directory dist/.
- “clean”: Cleanup the content of the directory dist/
- “post”: Create a new blog post whose filename and title come from the environment variables POST_TITLE and POST_NAME.
Write a Makefile to implement these steps for the actual Go-Hugo website’s source code.

## Requirements
- Same requirements as the previous task:
    - A Valid Go-Hugo website is provided
    - There are no Git Submodules
    - The theme ananke is installed
    - No directory dist/ committed
- GNU Make version 3.81 or 4.0 must be used

- The “Build” step should be executed by the command make build, “Clean” by make clean and “Post” by make post.
```
➜ ls -1 ./dist/
➜ make build
➜ ls -1 ./dist/index.html
index.html

➜ ls -1 ./content/posts/
welcome.md
➜ make POST_NAME=who-are-we POST_TITLE="Who are we" post
➜ ls -1 ./content/posts/
welcome.md who-are-we.md

➜ make clean
➜ ls -1 ./dist/
➜
```