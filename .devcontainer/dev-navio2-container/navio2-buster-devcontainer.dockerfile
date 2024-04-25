FROM debian:buster-slim
ARG USERNAME=vscode
ARG USER_UID=1000
ARG USER_GID=1000


ENV DEBIAN_FRONTEND=noninteractive

# Create the user
RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
    && apt-get update \
    && apt-get install -y sudo \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME

RUN apt install -y gcc-aarch64-linux-gnu python3 python3-distutils build-essential  gcc-arm-linux-gnueabihf-* && rm -rf /var/lib/apt/lists/*

USER $USERNAME