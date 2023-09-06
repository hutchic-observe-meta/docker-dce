# Use an official base image
FROM ubuntu:20.04

# Set environment variables to non-interactive
ENV DEBIAN_FRONTEND=non-interactive

# Install necessary tools
RUN apt-get update && apt-get install -y \
    wget \
    unzip \
    ca-certificates \
    --no-install-recommends \
    && rm -rf /var/lib/apt/lists/*

# Set build arguments for DCE version and SHA
ARG DCE_VERSION=v0.5.0
ARG DCE_SHA=cb140c743373e28a6c1bd4ba3fe1b81a7431dd538e1ad430fede3c1aff4508db

# Download DCE using the build arg for version
RUN wget -q https://github.com/Optum/dce-cli/releases/download/${DCE_VERSION}/dce_linux_amd64.zip

# Validate the checksum using the build arg for SHA
RUN echo "${DCE_SHA}  ./dce_linux_amd64.zip" | sha256sum -c -

# Unzip the file
RUN unzip ./dce_linux_amd64.zip -d /usr/local/bin && dce version

# Clean up
RUN rm dce_linux_amd64.zip

# Set the entrypoint to the DCE binary
ENTRYPOINT ["/usr/local/bin/dce"]
