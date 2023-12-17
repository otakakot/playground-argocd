#!/bin/bash -eu

export PORT=${1:-9090}

declare CONTEXT="kind-kind"

password=$(kubectl --context ${CONTEXT} -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo)

echo "${password}" | pbcopy

echo "Password: ${password}"

open http://localhost:${PORT}

kubectl --context ${CONTEXT} port-forward svc/argocd-server -n argocd ${PORT}:443
