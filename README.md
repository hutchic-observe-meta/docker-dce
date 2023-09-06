# DCE Docker Image

This repository contains the `Dockerfile` and related resources for building a Docker image equipped with the [DCE (Disposable Cloud Environment) CLI](https://github.com/Optum/dce-cli).

## Overview

The DCE Docker image provides an environment for running the DCE command-line interface without the need to install it directly on the host system.

## Prerequisites

- Docker

## Usage

### Building the Docker Image

To build the Docker image locally:

```bash
git clone https://github.com/hutchic-observe-meta/docker-dce.git
cd docker-dce
docker build -t hutchic-observe-meta/dce .
```

### Running DCE Inside the Docker Container

To run the DCE CLI inside the Docker container:

```bash
docker run -it hutchic-observe-meta/dce dce [commands]
```

Replace `[commands]` with your desired DCE commands.

## Environment Variables

For certain DCE operations, you'll need to set AWS-related environment variables. You can pass these into the Docker container as follows:

```bash
docker run \
  -e AWS_ACCESS_KEY_ID=your_access_key \
  -e AWS_SECRET_ACCESS_KEY=your_secret_key \
  -it hutchic-observe-meta/dce dce [commands]
```
