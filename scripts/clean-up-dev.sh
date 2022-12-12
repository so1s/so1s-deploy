#!/bin/bash

set -x

cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && cd ..

kubectl delete -f ./root-apps/root-dev.yaml --wait
kubectl delete -f ./project/project-dev.yaml --wait