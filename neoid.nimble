# Package

version       = "0.3.2"
author        = "Akito"
description   = "Nim implementation of NanoID."
license       = "MIT"


# Dependencies

requires "nim    >= 1.4.0"
requires "random >= 0.5.7"
when not defined(OpenBSD):
  requires "winim  >= 3.4.0"


# Tasks

task intro, "Initialize project. Run only once at first pull.":
  exec "git submodule add https://github.com/theAkito/nim-tools.git tasks || true"
  exec "git submodule update --init --recursive"
  exec "git submodule update --recursive --remote"
  exec "nimble configure"
task configure, "Configure project. Run whenever you continue contributing to this project.":
  exec "git fetch --all"
  exec "nimble check"
  exec "nimble --silent refresh"
  exec "nimble install --accept --depsOnly"
  exec "git status"
task dbuild, "Debug Build project.":
  exec """nim c \
            --define:debug:true \
            --debuginfo:on \
            --out:neoid_debug \
            neoid
       """
task fbuild, "Build project.":
  exec """nim c \
            --define:danger \
            --opt:speed \
            --out:neoid \
            neoid
       """
task test, "Test project.":
  exec "nim c -r tests/test_generate.nim"
  exec "nim c -r tests/test_nonsecure.nim"
task makecfg, "Create nim.cfg for optimized builds.":
  exec "nim tasks/cfg_optimized.nims"
task clean, "Removes nim.cfg.":
  exec "nim tasks/cfg_clean.nims"
