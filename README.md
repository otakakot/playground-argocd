# playground-argocd

## install kind

[Quick Start](https://kind.sigs.k8s.io/docs/user/quick-start/)

```shell
brew install kind
```

```shell
kind create cluster
```

## install kubectx

[kubectx](https://github.com/ahmetb/kubectx)

```shell
brew install kubectx
```

## install argocd cli

```shell
brew install argocd
```

## install helm

```shell
brew install helm
```

## initialize argocd

```shell
make kind
make argocd
```
