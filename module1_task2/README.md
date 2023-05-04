# 2. Empathy as Code: Inline Help, Comment and Documentation

As you are thinking about the person who will be in charge of this website after your mission for Awesome Inc. is finished, you want to write proper documentation.

You want to write a README.md file in Markdown syntax which describes the requirements to build the website (Go-Hugo, Make, etc.), describes the lifecycle and its steps.

As an accomplished command line user, you also feel that providing a command line “help” could be a great addition, as well as comment for source code readers.

## Prerequisites

- Same requirements as the previous task:
    - A Valid Go-Hugo website is provided
    - There are no Git Submodules
    - The theme ananke is installed
    - No directory dist/ committed
    - Makefile present

- Add comments in the Makefile to describe what each target is expected to do.
    - These comments should be written on the same line as the targets
    - Each comment should start with two characters #

## Lifecycle

- Commands created:
    - build
    - clean
    - post
    - help