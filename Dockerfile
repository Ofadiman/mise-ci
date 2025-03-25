FROM ubuntu:24.04@sha256:72297848456d5d37d1262630108ab308d3e9ec7ed1c3286a32fe09856619a782

RUN apt-get update \
  && apt-get install -y curl git \
  && rm -rf /var/lib/apt/lists/*

USER ubuntu

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

WORKDIR /home/ubuntu

RUN curl -fsSL https://mise.run | sh

ENV MISE_CONFIG_GLOBAL="/home/ubuntu/.config/mise/config.toml"
ENV PATH="/home/ubuntu/.local/bin:$PATH"
ENV PATH="/home/ubuntu/.local/share/mise/shims:$PATH"

COPY mise.toml /home/ubuntu/.config/mise/config.toml

RUN mise install
