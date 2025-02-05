FROM myoung34/github-runner:2.322.0-ubuntu-noble

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


