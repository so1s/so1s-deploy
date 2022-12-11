#!/bin/bash

set -x

kubectl apply -f ./project/project-prod.yaml --wait
kubectl apply -f ./root-prod.yaml --wait