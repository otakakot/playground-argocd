#!/bin/bash -eu

declare context="kind-kind"

kubectl --context ${context} create namespace argocd

kubectl --context ${context} apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
