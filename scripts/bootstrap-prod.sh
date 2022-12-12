#!/bin/bash

set -x

cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && cd ..

kubectl apply -f ./project/project-prod.yaml --wait
kubectl apply -f ./root-apps/root-prod.yaml --wait