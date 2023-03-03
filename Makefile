.PHONY: web
web: ## make login port=9090
	@./script/web-argocd.sh ${port}

.PHONY: argocd
argocd:
	@./script/create-argocd.sh

.PHONY: kind
kind:
	@kind create cluster

.PHONY: destroy
destroy:
	@kind delete cluster
