#!/bin/bash

set -x

cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && cd ..

if ! [ -x "$(command -v nix-shell)" ]; then
    rm nix.sh
    curl -L https://nixos.org/nix/install > nix.sh
    chmod +x nix.sh
    ./nix.sh --daemon
fi