kubectl create secret generic application-secret --dry-run=client --from-env-file=./secrets.env -o json > secrets.json
kubeseal --controller-name so1s-sealed-secrets --controller-namespace sealed-secrets --scope cluster-wide -o yaml < secrets.json > sealed-secret.yaml

kubectl create secret docker-registry so1s --dry-run=client --from-file=./docker-config.json -o json > docker-pull-secret.json
kubeseal --controller-name so1s-sealed-secrets --controller-namespace sealed-secrets --scope cluster-wide -o yaml < docker-pull-secret.json > docker-pull-secret.yaml

mv sealed-secret.yaml docker-pull-secret.yaml ./charts/backend/templates/