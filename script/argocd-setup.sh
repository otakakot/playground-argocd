#!/bin/bash -eu

export PORT=${1:-9090}

declare CONTEXT="kind-kind"

declare PROJ="playground"

declare REPO_URL="git@github.com:otakakot/playground-argocd.git"

kubectl --context ${CONTEXT} port-forward svc/argocd-server -n argocd ${PORT}:443 > /dev/null 2>&1 &

PID=$!

sleep 30

PASSWORD=$(kubectl --context ${CONTEXT} -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo)

argocd login localhost:${PORT} --username admin --password ${PASSWORD} --insecure

argocd version

# https://argo-cd.readthedocs.io/en/stable/user-guide/commands/argocd_proj_create/
argocd proj create ${PROJ} --description 'for playground'
echo "created ${PROJ}"

# https://argo-cd.readthedocs.io/en/stable/user-guide/commands/argocd_proj_add-destination/
argocd proj add-destination ${PROJ} '*' '*'
echo "added destination"

# https://argo-cd.readthedocs.io/en/stable/user-guide/commands/argocd_proj_allow-cluster-resource/
argocd proj allow-cluster-resource ${PROJ} '*' '*'
echo "allowed cluster resource"

# https://argo-cd.readthedocs.io/en/stable/user-guide/commands/argocd_proj_add-source/
argocd proj add-source ${PROJ} ${REPO_URL}
echo "added source ${REPO_URL}"

kill ${PID}
