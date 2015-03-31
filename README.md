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


TODO
----

* Extract Haskell version (keep history)

* Publish versions in other languages and document them


Similar project
---------------

https://github.com/jwiegley/git-all (haskell)


Materials
---------

### Haskell doc

http://en.wikibooks.org/wiki/Haskell
http://learnyouahaskell.com/
http://book.realworldhaskell.org/read/index.html
http://stackoverflow.com/questions/3077866/large-scale-design-in-haskell
http://stackoverflow.com/questions/6609643/haskell-library-to-manipulate-a-git-repo (git)
https://github.com/wlangstroth/haskell-samples


### Ruby code

  For git: grit, rugged, minigit
