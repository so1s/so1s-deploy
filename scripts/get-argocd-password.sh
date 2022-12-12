#!/bin/bash

set -x

cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && cd ..

argoCDPassword=$(kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo)
rm -f ./argocd-password
echo $argoCDPassword > ./argocd-password