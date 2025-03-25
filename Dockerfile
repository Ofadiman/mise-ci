FROM ubuntu:24.04@sha256:72297848456d5d37d1262630108ab308d3e9ec7ed1c3286a32fe09856619a782

ENV MISE_TRUSTED_CONFIG_PATHS="/home/ubuntu"
ENV PATH="/home/ubuntu/.local/bin:$PATH"
ENV PATH="/home/ubuntu/.local/share/mise/shims:$PATH"

RUN apt-get update \
  && apt-get install -y curl git gnupg \
  && rm -rf /var/lib/apt/lists/*

USER ubuntu

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

WORKDIR /home/ubuntu

RUN curl -fsSL https://mise.run | sh

COPY --chmod=0755 "entrypoint.sh" "/home/ubuntu/entrypoint.sh"
ENTRYPOINT ["/home/ubuntu/entrypoint.sh"]
