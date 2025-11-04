FROM ghcr.io/project-chip/chip-build:174
RUN apt update \
    && \
    apt install -y openssh-client
WORKDIR /root/
RUN ssh-keyscan github.com >> ~/.ssh/known_hosts
# ADD git@github.com:operation404/Lightbulb-Automation.git /root/chip/
RUN --mount=type=ssh git clone --depth=1 git@github.com:project-chip/connectedhomeip.git
RUN  ./connectedhomeip/scripts/checkout_submodules.py --shallow --platform  linux
WORKDIR /root/connectedhomeip/
SHELL ["/bin/bash", "-exo", "pipefail", "-c"]
RUN source scripts/bootstrap.sh 
RUN scripts/build_python.sh -m platform -i out/python_env
RUN apt install sudo
