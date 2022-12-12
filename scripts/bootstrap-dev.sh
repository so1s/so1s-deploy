#!/bin/bash

set -x

rootDir=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

kubectl apply -f $rootDir/project/project-dev.yaml --wait
kubectl apply -f $rootDir/root-apps/root-dev.yaml --wait