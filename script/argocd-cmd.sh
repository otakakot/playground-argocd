#!/bin/bash -eu

export CMD=${1:-version}

declare CONTEXT="kind-kind"

declare PORT="9999"

# ログインしコマンドを実行するためにポートフォワードする
kubectl --context ${CONTEXT} port-forward svc/argocd-server -n argocd ${PORT}:443 > /dev/null 2>&1 &

sleep 1

PASSWORD=$(kubectl --context ${CONTEXT} -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo)

argocd login localhost:${PORT} --username admin --password ${PASSWORD} --insecure > /dev/null

CODE=0

argocd ${CMD} || { CODE=$?; }

sleep 1

argocd logout localhost:${PORT} > /dev/null

exit ${CODE}
