#!/bin/bash

set -x

cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && cd ..

kubectl get secret -n sealed-secrets -o name | grep sealed-secrets-key | kubectl get secret -n sealed-secrets -o yaml > ./cert.yaml