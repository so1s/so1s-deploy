#!/bin/bash

set -x

cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && cd ..

kubectl apply -f ./cert.yaml --wait
kubectl rollout restart deployment -n sealed-secrets so1s-sealed-secrets

kubectl wait --for condition=Available=True -n sealed-secrets deployment/so1s-sealed-secrets --timeout=2m