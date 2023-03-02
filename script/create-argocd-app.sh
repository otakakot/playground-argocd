#!/bin/bash -eu

export PORT=${1:-9090}

declare context="kind-kind"

password=$(kubectl --context ${context} -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo)

argocd login localhost:${PORT} --username admin --password ${password} --insecure

argocd version
