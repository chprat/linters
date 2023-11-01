#!/bin/bash

if [ ! -f /.dockerenv ]; then
    docker build -t ghcr.io/chprat/linters .
    docker run --rm --volume "$(pwd):/code:ro" ghcr.io/chprat/linters
    exit
fi

echo "Running shellcheck"
shellcheck ./*.sh

echo "Running editorconfig-checker"
"$HOME/.local/bin/ec" -exclude "\\.git"

echo "Running hadolint"
hadolint Dockerfile

echo "Running markdownlint"
mdl ./*.md

echo "Running actionlint"
"$HOME/.local/bin/actionlint"
