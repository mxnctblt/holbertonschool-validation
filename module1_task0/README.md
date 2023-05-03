# 0. Go-Hugo Website

For your first day at “Awesome Inc.”, you are tasked to work on the corporate website. The communication department wants you to allow them to write and publish blog posts on the website in total autonomy.

Your boss tells you that the website infrastructure has documentation and sends you a link to an internal wiki page that contains the following instructions:
```
# README for "Awesome Inc." Website

Ain't nobody got time to write documentation: I've put all the HTML and CSS into `public/index.html` on the production server.

If you want to update the site: edit the `index.html` file in place so you can go fast.
```
You also receive an email from the communication department:
```
Hello dear IT colleague!

Our team is experienced in writing in Markdown language as they use the Go-Hugo static site generator (https://gohugo.io/getting-started/quick-start/) internally.

Do you mind to switch to Go Hugo to avoid writing HTML content for our blog posts?
```
Let’s get started: you are expected to provide the source code of a new website that can be built using Go-Hugo.
## Requirements
- Use the theme “ananke” for the website by following this Quickstart
- If you are using the sandboxe, do NOT install hugo with the package manager. Download the correct executable or package file from their github.
- Usage of Git Submodules is prohibited: there should be no file .gitmodules
- The website title should be “Awesome Inc.”
- The contents consists in a single blog post which title should be “Welcome to Awesome Inc.”, stored in a file named welcome.md
- All of the website’s source code is stored under a directory named module1_task0
- The command line hugo in version 0.84.0 must be used
- The website is expected to be generated into the directory module1_task0/dist/
- The directory module1_task0/dist/ must not be committed (it should be absent from the repository)
Here is a simple example of the expected generation process:
```
➜ ls -l dist/ 2>/dev/null | wc -l
0
➜ hugo > /dev/null 2>&1
➜ ls dist/ 2>/dev/null | grep -c 'index.html'
1
```