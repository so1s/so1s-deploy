#!/bin/bash

set -x

cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && cd ..

kialiToken=$(kubectl get secret -n istio-system $(kubectl get secret -n istio-system --no-headers -o custom-columns=":metadata.name" | grep kiali-token) -o jsonpath={.data.token} | base64 -d)

rm -f ./kiali-token
echo $kialiToken > ./kiali-token
