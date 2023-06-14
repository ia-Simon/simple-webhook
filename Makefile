.PHONY: help
$(VERBOSE).SILENT:

ifndef LOG_TAILING_INITIAL_LINES
LOG_TAILING_INITIAL_LINES=50
endif

# Function and macros
input=read -p "$(1)" $(2)
safe_input=read -s -p "$(1)" $(2) && echo ''

# Self-Documented Makefile
# https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
help:
	@grep -E '^(\w|-)+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
.DEFAULT_GOAL := help

# ======================================================================================================
### Docker Usage
# ======================================================================================================

build: ## Build simplewebhook docker image
	echo "Building simplewebhook..." && docker image build -t simplewebhook webhook && echo ''

run: build ## Run simplewebhook container
	touch history.log
	docker run -it --rm -e LOG_TAILING_INITIAL_LINES=$(LOG_TAILING_INITIAL_LINES) \
		-v $$(pwd)/history.log:/history.log simplewebhook

clean: ## Clean docker execution files
	docker image rm simplewebhook
	rm history.log

# ======================================================================================================
### Local Usage
# ======================================================================================================

run-local: ## Run application locally
	cd webhook && \
	go run .

clean-local: ## Clean local execution files
	cd webhook && \
	rm simple-webhook
	rm *.log

build-local: ## Build application
	cd webhook && \
	go mod download && \
	go build

install-local: build-local ## Install application to GOPATH/bin
	cd webhook && \
	go install
