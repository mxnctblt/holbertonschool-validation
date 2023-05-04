# 3. From Development to Production

Now that you automated the website generation and documented the process, it’s time to deploy this new site to the production environment.

Your next goal is to improve the delivery process to help your colleagues from the “production team” (e.g. the team in charge of the production infrastructure). After sending the instructions to the production team, you receive the following answer:
```
Dear Developer,

I followed the instructions you gave me to generate the website. The command `make build` is failing on the production server with an error. Can you please help me?

## Production Instructions

* The production website is hosted in an Ubuntu 18.04 Docker container
* The applications "GoHugo" and "Make" are installed with `apt-get update && apt-get install -y hugo make`.
* When running the command `make build`, there is a bunch of errors which end with the following lines:

Error: Error building site: logged 15 error(s)
Makefile:2: recipe for target 'build' failed
make: *** [build] Error 255

```
So that you understand what is happening to debug the issue, let’s start by reproducing the production environment on your development machine.

## Requirements

- Write a shell script named setup.sh to reproduce a pseudo “production” environment locally
    - The script must be executable
    - The script must reproduce all the steps described in the “Production Instructions”
    - The script file is located at the root of your project, along with the Makefile
- The script should be executed in a disposable Ubuntu 18.04 environment
    - You can spawn a sandboxed environment with the following command (with Docker): docker run --rm --tty --interactive --volume=$(pwd):/app --workdir=/app ubuntu:18.04 /bin/bash and use the command exit to quit (and delete) the environment.
- The result of the script execution should be the same as what is described by your colleague: it must exit with the error code from Make and prints the full error in the stderr.
