#!/bin/sh

# exit immediately if brew is already in $PATH
type brew >/dev/null 2>&1 && exit

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"