kubectl create secret generic application-secret --dry-run=client --from-env-file=./secrets.env -o json > secrets.json
kubeseal --controller-name sealed-secrets --controller-namespace default --scope cluster-wide -o yaml < secrets.json > sealed-secret.yaml

mv sealed-secret.yaml ./charts/backend/templates/