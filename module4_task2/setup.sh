#!/bin/bash

apt-get update &&  apt-get install -y curl

## Add official nodejs distribution apt repository
curl -sL https://deb.nodesource.com/setup_14.x | bash -

apt-get install -y --no-install-recommends nodejs=14.*

npm install --global \
  markdownlint-cli@0.26.0 \
  markdown-link-check@3.8.6 2> /dev/null

exit $?
