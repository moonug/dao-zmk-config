.DEFAULT_GOAL:=help

.PHONY: help act

help: ## Показать справку.
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m<target>\033[0m\n\nTargets:\n"} /^[a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-10s\033[0m %s\n", $$1, $$2 }' $(MAKEFILE_LIST)

act: ## Запустить github workflow локально
	mkdir -p ./artifacts
	act --container-architecture linux/amd64 --artifact-server-path ./artifacts
