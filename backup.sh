#!/bin/bash

# - Backing up the entire directory recursively, not just the content.

# TODO 1
#   * Encrypt the personal data and back up the encrypted.
#   * Make a key for that, and save it. Know the key very well.
#   * Understand the key and how it is used to encrypt and decrypt.
#   * Without the key, you do not have access to your data.

# TODO 2
#   * Automating backing up and restoring.
#   * Consider the files which will be encrypted.


TEST="--dry-run"
OPT="-rxvPtu"
destination="/Volumes/Moi/mac_backups"
directories="iOS_Courses ComputerScience/ios Cooking Current_Term ComputerScience Quran Awesome"
VimDotDir=".vim  .vimrc  .vimrc_helper"


rsync $OPT $TEST $directories $destination
rsync $OPT $TEST $VimDotDir   $destination"/vim"
