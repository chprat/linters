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
