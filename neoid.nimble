# Package

version       = "0.3.1"
author        = "Akito"
description   = "Nim implementation of NanoID."
license       = "MIT"


# Dependencies

requires "nim    >= 1.4.0"
requires "random >= 0.5.7"
requires "winim  >= 3.4.0"


# Tasks

task configure, "Configure project.":
  exec "git fetch"
  exec "git pull"
  exec "git checkout master"
  exec "git submodule add git@github.com:theAkito/nim-tools.git tasks"
  exec "git submodule update --init --recursive"
  exec "git submodule update --recursive --remote"
  exec "nimble check"
  exec "nimble install -d"
task dbuild, "Build test bin.":
  exec """nim c \
            --debuginfo:on \
            --define:mingw \
            --out:neoid_debug \
            neoid
       """
