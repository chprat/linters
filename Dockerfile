FROM debian:bookworm-slim
ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Berlin

# install required tools and shellcheck
RUN apt-get update && apt-get install --no-install-recommends -y \
    curl \
    locales \
    pipx \
    python3 \
    ruby \
    shellcheck \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# generate locale
RUN sed -i '/en_US.UTF-8/s/^#//g' /etc/locale.gen && locale-gen \
    && update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
ENV LANG=en_US.UTF-8

# add ~/.local/bin to PATH
# we don't want variable expansion in this case
# hadolint ignore=SC2016
RUN echo 'export PATH="$PATH:$HOME/.local/bin"' >> /etc/skel/.bashrc

# install editorconfig-checker
RUN pipx ensurepath \
    && pipx install --include-deps editorconfig-checker

# install hadolint
# the shell directive solves https://github.com/hadolint/hadolint/wiki/DL4006
SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN export "HADOLINT_VERSION=$(curl -s https://api.github.com/repos/hadolint/hadolint/releases/latest | grep -Po '"tag_name": "v\K[^"]*')" \
    && curl -LJR "https://github.com/hadolint/hadolint/releases/download/v$HADOLINT_VERSION/hadolint-Linux-x86_64" -o /usr/bin/hadolint \
    && chmod +x /usr/bin/hadolint

# install markdownlint
RUN gem install mdl

WORKDIR /code
ENTRYPOINT [ "/code/lint.sh" ]
