#!/bin/bash -eu

declare CONTEXT="kind-kind"

cat argocd/argocd.yaml | kubectl --context="${CONTEXT}" apply -f-

cat argocd/project.yaml | kubectl --context="${CONTEXT}" apply -f-
