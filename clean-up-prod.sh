#!/bin/bash

set -x

kubectl delete -f ./root-prod.yaml --wait
kubectl delete -f ./project/project-prod.yaml --wait