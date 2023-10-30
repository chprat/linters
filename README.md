linters
=======

This repository provides the files to create a Docker container, which contains
the linters I usually use in my projects. Having them in a separate repository
and image eliminates the need to maintain them in each project separately.

These linters are currently included:

- [editorconfig-checker](https://github.com/editorconfig-checker/editorconfig-checker)
  to make sure the files comply to a .editorconfig file
- [hadolint](https://github.com/hadolint/hadolint) for Dockerfiles
- [markdownlint](https://github.com/markdownlint/markdownlint) for Markdown files
- [shellcheck](https://github.com/koalaman/shellcheck) for shell scripts

Usage
-----

To use the Docker image, you can pull it from the repositories integrated
package repository. To use it you need to:

- create a file *lint.sh*, which calls the linters in the container
- mount your source code folder to the folder */code* in the container
- create configuration files for the linters, if required

Docker image tags
-----------------

Through GitHub Actions several tagged versions of the Docker image are
available. The image name is `ghcr.io/chprat/linters`, the available tags are:

- `:<branch>`: built from a branch
