# 4. Testing a Static Website

## Prerequisites
- Same requirements as the previous module (last task):

    - A Valid Go-Hugo website is provided
    - There are no Git Submodules
    - The theme ananke is installed
- A Makefile must be present with at least the targets build, check, help, clean, and validate

- Update the target build to generate the website from the markdown and configuration files in the directory dist/ after “checking” the markdown files. If one of those files is not correct, do not try to build.

- Update the target clean to delete the folder dist/

- Documentation is expected to be up-to-date (README.md and make help target)

- The target check should succeed by default, and fail when presented with a dead link or a badly written Markdown file:

```
➜ ls -1 ./content/posts/welcome.md
./content/posts/welcome.md
➜ make check >/dev/null 2>&1 && echo OK
OK
➜ echo 'This is a dead link: [Google](http://www.google.deadlink)' | tee -a ./content/posts/welcome.md
➜ make check >/dev/null 2>&1 || echo FAIL
FAIL
➜ sed -i '/www.google.deadlink/d' ./content/posts/welcome.md
➜ echo '# Unexpected level-1 title Hello' | tee -a ./content/posts/welcome.md
➜ make check >/dev/null 2>&1 || echo FAIL
FAIL
```
- The target validate must always succeed by default and should print the result on the stdout:
```
➜ ls -1 ./dist/index.html
./dist/index.html

➜ make validate >/dev/null 2>&1 && echo SUCCESS
SUCCESS

➜ echo '<!DOCTYPE html><html lang = "en"><head><title>Hello</title></head><body></body></html>' | tee ./dist/index.html
➜ make validate && echo SUCCESS
./dist/index.html: OK
SUCCESS

➜ echo '<!DOCTYPE html><head><title>Hello</title></head><body></body></html>' | tee ./dist/index.html
➜ make validate && echo SUCCESS
[./dist/index.html:1] Consider adding a “lang” attribute to the “html” start tag to declare the language of this document.
SUCCESS
```

## Lifecycle

- Commands created:
    - build
    - clean
    - post
    - help
    - check
    - validate