.PHONY: login
login: ## make login port=9090
	@./script/argocd-login.sh ${port}

.PHONY: argocd
argocd:
	@./script/argocd-setup.sh

.PHONY: kind
kind:
	@kind create cluster

.PHONY: destroy
destroy:
	@kind delete cluster
