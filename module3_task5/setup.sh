#!/bin/bash

apt-get update && apt-get install -y make wget

# download/install minimal version to use template ananke
wget https://github.com/gohugoio/hugo/releases/download/v0.109.0/hugo_extended_0.109.0_Linux-64bit.tar.gz
tar -xvf hugo_extended_0.109.0_Linux-64bit.tar.gz hugo
mv hugo /usr/local/bin/

#remove file after installation
rm hugo_extended_0.109.0_Linux-64bit.tar.gz

# download/install linter
go install github.com/golangci/golangci-lint/cmd/golangci-lint@v1.52.2
npm install -g markdownlint-cli
npm install -g markdown-link-check

