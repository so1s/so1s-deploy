#!/usr/bin/env nix-shell
#!nix-shell -i bash -p bash kubectl kubernetes-helm-wrapped argocd

set -x

cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && cd ..

helm repo add argo https://argoproj.github.io/argo-helm

helm install argocd -n argocd -f ./charts/argocd/argocd-dev-values.yaml argo/argo-cd --create-namespace --wait
helm install external-dns -n kube-system -f ./charts/public/external-dns/dev-values.yaml ./charts/public/external-dns --create-namespace
helm install alb -n kube-system -f ./charts/public/aws-load-balancer-controller/dev-values.yaml ./charts/public/aws-load-balancer-controller --create-namespace
helm install gpu -n gpu -f ./charts/extension/gpu/dev-values.yaml ./charts/extension/gpu --create-namespace

kubectl apply -f ./project/project-dev.yaml --wait
kubectl apply -f ./apps/dev/app-sealed-secrets.yaml --wait