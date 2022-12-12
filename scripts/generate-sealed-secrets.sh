#!/bin/bash

set -x

cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && cd ..

kubectl create secret generic application-secret --dry-run=client --from-env-file=./secrets.env -o json > secrets.json
kubeseal --controller-name so1s-sealed-secrets --controller-namespace sealed-secrets --scope cluster-wide -o yaml < secrets.json > sealed-secret.yaml

mv sealed-secret.yaml ./charts/backend/templates/

kubectl create secret generic grafana-admin-secret --dry-run=client --from-env-file=./grafana.env -n monitoring -o json > grafana-secret.json
kubeseal --controller-name so1s-sealed-secrets --controller-namespace sealed-secrets --scope cluster-wide -o yaml < grafana-secret.json > grafana-secret.yaml

mv grafana-secret.yaml ./charts/monitoring/templates/