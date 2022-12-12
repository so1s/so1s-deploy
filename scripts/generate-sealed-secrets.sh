#!/bin/bash

set -x

cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && cd ..

kubectl create secret generic application-secret --dry-run=client --from-env-file=./secrets.env -o json > secrets.json
kubeseal --controller-name so1s-sealed-secrets --controller-namespace sealed-secrets --scope cluster-wide -o yaml < secrets.json > sealed-secret.yaml

kubectl create secret generic default-registry --dry-run=client --from-env-file=./registry.env -n backend -o json > registry-secret.json
kubeseal --controller-name so1s-sealed-secrets --controller-namespace sealed-secrets --scope cluster-wide -o yaml < registry-secret.json > registry-secret.yaml

mv sealed-secret.yaml registry-secret.yaml ./charts/backend/templates/