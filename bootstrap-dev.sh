#!/bin/bash

set -x

kubectl apply -f ./project/project-dev.yaml --wait
kubectl apply -f ./root-dev.yaml --wait