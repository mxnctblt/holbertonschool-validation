# 4. Fixing the Production Deployment
Now that you are able to reproduce the same error as the production’s, you have to analyse and fix it.

By reading carefully the output from the setup.sh script, you are expected to find the error caused by the production’s environment.

You have to fix the error by updating the script setup.sh to help your colleagues from the production team.
## Requirements
- Update the shell script named setup.sh
    - The script must be executable
    - The script file is located at the root of your project, along with the Makefile
- The script should be executed in a fresh Ubuntu 18.04 environment
    - You can spawn a sandboxed environment with the following command (with Docker): docker run --rm --tty --interactive --volume=$(pwd):/app --workdir=/app ubuntu:18.04 /bin/bash and use the command exit to quit (and delete) the environment.
- The result of the script execution should be successful (with an exit code 0) with the directory ./dist containing the generated website.

```
➜ grep 'UBUNTU_CODENAME' /etc/os-release
UBUNTU_CODENAME=bionic
➜ command -v hugo >/dev/null 2>&1 || echo "No 'hugo'"
No 'hugo'
➜ ls -l dist/ 2>/dev/null | wc -l
0
➜ ./setup.sh >/dev/null 2>&1
➜ echo $?
0
➜ hugo > /dev/null 2>&1
➜ ls dist/ 2>/dev/null | grep -c 'index.html'
1
```