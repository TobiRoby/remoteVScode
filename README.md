# remoteVScode
Setup Repository for DSBarcamp remote VSCode in Docker.

This is a template for starting a local docker container used via VS Code as an interactive python interpreter.

Install docker and docker-compose on the container host machine (local or remote).

https://docs.docker.com/install/overview/
https://docs.docker.com/compose/install/

Have the Dockerfile, docker-compose.yml, environment.yml, environment.dev.yml and .devcontainer.json present in your project's root folder. (local or remote) Change the environment.yml/environment.dev.yml to your needs.

Add ```"docker.attachShellCommand.linuxContainer": "//bin/sh"``` to your settings.json. This is required to run a linux container in VS Code on windows.

Install the "Remote - Containers" extension in VS Code.

# Docker container on local machine

2 ways to start developing in a local container:

1. Automatic container start

    Make use of ".devcontainer.json"-file by selecting ```Remote - Containers: Reopen Folder in Container```

2. Manual container start

    Start a dev container using ```docker-compose up dev``` (To start the image in detached mode (in the background) add an additional ```-d``` at the end.)

    You can now use the docker container by selecting ```Remote - Containers: Attach to Running Container```
