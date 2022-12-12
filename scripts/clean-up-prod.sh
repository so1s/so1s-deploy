#!/bin/bash

set -x

cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && cd ..

kubectl delete -f ./root-apps/root-prod.yaml --wait
kubectl delete -f ./project/project-prod.yaml --wait