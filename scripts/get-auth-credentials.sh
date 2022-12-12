#!/bin/bash

set -x

cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && cd ..

export backendPassword=$(kubectl -n backend get secret backend-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo)

export argocdPassword=$(kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo)

export kialiToken=$(kubectl get secret -n istio-system $(kubectl get secret -n istio-system --no-headers -o custom-columns=":metadata.name" | grep kiali-token) -o jsonpath={.data.token} | base64 -d)

export grafanaUser=$(kubectl -n monitoring get secret grafana-admin-secret -o jsonpath="{.data.admin-user}" | base64 -d; echo)
export grafanaPassword=$(kubectl -n monitoring get secret grafana-admin-secret -o jsonpath="{.data.admin-password}" | base64 -d; echo)

rm -f ./auth-credentials.yaml
envsubst < ./scripts/auth-credentials.template.yaml > ./auth-credentials.yaml

unset backendPassword
unset argocdPassword
unset kialiToken
unset grafanaUser
unset grafanaPassword