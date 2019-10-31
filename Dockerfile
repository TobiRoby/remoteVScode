# BASE
FROM ubuntu:18.04 AS base

RUN apt-get update && apt-get install -y \
    sudo \
    apt-utils \
    wget \
    git

# install miniconda
WORKDIR /home/root/
RUN wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -O miniconda.sh && \
    chmod +x ./miniconda.sh && \
    ./miniconda.sh -b -u -p miniconda3 && \
    rm ./miniconda.sh

ENV PATH="/home/root/miniconda3/bin:${PATH}"

# Set timezone in container
ENV TZ=Europe/Berlin
ENV DEBIAN_FRONTEND=noninteractive
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone && \
    apt-get install -y tzdata && \
    dpkg-reconfigure --frontend noninteractive tzdata

RUN mkdir -p /home/root/project
WORKDIR /home/root/project
# conda installations (e.g. environment creation)
COPY environment.yml .
RUN conda-env create -f environment.yml && \
    rm -f environment.yml

# DEV
FROM base as dev
# conda installations (e.g. environment update)
COPY environment.dev.yml .
RUN conda-env update -f environment.dev.yml && \
    rm -f environment.dev.yml

# TODO find better way to allow pre-commit hooks for black
RUN conda install -y black -c conda-forge

# PROD
FROM base as prod
COPY . /
