#!/bin/bash -eu

declare CONTEXT="kind-kind"

kubectl --context ${CONTEXT} create namespace argocd

kubectl --context ${CONTEXT} apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
