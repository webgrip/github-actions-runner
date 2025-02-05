# This uses the official Docker-in-Docker image as a "base"
# so we can copy the Docker daemon binaries and config from it.
FROM docker:20.10.24-dind AS dind-base

FROM myoung34/github-runner:2.322.0-ubuntu-jammy

RUN apt-get update -y \
    && DEBIAN_FRONTEND=noninteractive apt-get install -yq \
        curl \
        jq \
        build-essential \
        libssl-dev \
        libffi-dev \
        python3 \
        python3-venv \
        python3-dev \
        python3-pip \
        ca-certificates \
        gnupg \
        iputils-ping \
        libicu-dev \
        sudo \
        mysql-client \
        openssh-client \
        nano \
        vim \
        git \
        rsync \
        unzip \
        netcat \
        dnsutils \
    && rm -rf /var/lib/apt/lists/*

COPY --from=dind-base /usr/local/bin/ /usr/local/bin/

