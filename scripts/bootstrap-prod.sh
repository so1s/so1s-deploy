#!/bin/bash

set -x

rootDir=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

kubectl apply -f $rootDir/project/project-prod.yaml --wait
kubectl apply -f $rootDir/root-apps/root-prod.yaml --wait