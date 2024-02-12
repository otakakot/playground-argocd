# dashboard

```shell
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.0.0/aio/deploy/recommended.yaml
kubectl apply -f monitor/serviceaccount.yaml
kubectl apply -f monitor/clusterrolebinding.yaml
kubectl -n kubernetes-dashboard create token admin-user
kubectl proxy
open 'http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/'
```

ref: https://kubernetes.io/ja/docs/tasks/access-application-cluster/web-ui-dashboard/
