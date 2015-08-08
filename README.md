Gná
===

  Tool to manage a large number of git repositories. Mostly a learning
project for new languages.

  This repository includes Haskell and Elixir versions.


Planned features
----------------

* `check` subcommand, query all configured repositories for:
  - unclean working dir
  - not in master branch (configurable)
  - branches with remote updates

* `discover` subcommand takes a directory as argument, finds all git
  repositories and write a run control file.

* `list` subcommand, list all configured repositories.
