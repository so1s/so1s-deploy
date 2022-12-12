#!/usr/bin/env nix-shell
#!nix-shell -i bash -p bash kubectl helm argocd

set -x

cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && cd ..

helm repo add argo https://argoproj.github.io/argo-helm
helm repo add aws https://aws.github.io/eks-charts

helm install argocd -n argocd -f ./argocd/dev-values.yaml argo/argo-cd --create-namespace --wait
helm install external-dns -n kube-system -f ./charts/public/external-dns/dev-values.yaml ./charts/public/external-dns --create-namespace --wait
helm install alb -n kube-system -f ./charts/public/aws-load-balancer-controller/dev-values.yaml aws/aws-load-balancer-controller --create-namespace --wait
helm install gpu -n gpu -f ./charts/extension/gpu/dev-values.yaml ./charts/extension/gpu --create-namespace --wait

argoCDPassword=$(kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo)
rm -f ./argocd-password
echo $argoCDPassword > ./argocd-password

kubectl apply -f ./project/project-dev.yaml --wait
kubectl apply -f ./apps/dev/app-sealed-secrets.yaml --wait