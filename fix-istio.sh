#!/usr/bin/env nix-shell
#!nix-shell -i bash -p bash kubectl argocd

set -x

namespace=`kubectl config view --minify -o jsonpath='{..namespace}'`

echo "Sync Istio App"
kubectl config set-context --current --namespace=argocd
argocd app sync so1s-istio-app-prod --core --prune --replace --force > /dev/null
argocd app sync so1s-istio-app-dev --core --prune --replace --force > /dev/null
kubectl config set-context --current --namespace=default