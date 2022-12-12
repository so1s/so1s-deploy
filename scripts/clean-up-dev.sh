#!/bin/bash

set -x

kubectl delete -f ./root-dev.yaml --wait
kubectl delete -f ./project/project-dev.yaml --wait