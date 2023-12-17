.PHONY: help
help: ## display this help screen
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m<target>\033[0m\n"} /^[a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)

.PHONY: kind
kind: ## make kind
	@kind create cluster

.PHONY: argocd
argocd: ## make argocd
	@./script/argocd-install.sh
	@sleep 30
	@./script/argocd-setup.sh
	@sleep 30
	@./script/argocd-apply.sh

.PHONY: login
login: ## make login port=9090
	@./script/argocd-login.sh ${port}

.PHONY: destroy
destroy: ## make destroy
	@kind delete cluster
