#!/bin/bash

set -ex

FILE="Chart.yaml"
for dir in $(ls -d charts/*); do
NAME=$(echo $dir | cut -d '/' -f2)

if [ -e $dir/$FILE ];then
    helm lint $dir
    helm template $NAME -n $NAME -f ./charts/$NAME/dev-values.yaml ./charts/$NAME  --create-namespace --with-subcharts --wait > dev-$NAME-template.yaml
    helm template $NAME -n $NAME -f ./charts/$NAME/prod-values.yaml ./charts/$NAME  --create-namespace --with-subcharts --wait > prod-$NAME-template.yaml
fi
done