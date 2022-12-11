#!/bin/bash

set -x

if ! [ -x "$(command -v nix-shell)" ]; then
    rm nix.sh
    curl -L https://nixos.org/nix/install > nix.sh
    chmod +x nix.sh
    ./nix.sh --daemon
fi