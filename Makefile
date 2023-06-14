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
### Project 
# ======================================================================================================

build: ## Build simplewebhook docker image
	echo "Building simplewebhook..." && docker image build -t simplewebhook webhook && echo ''

run: build ## Build and run simplewebhook container
	touch history.log
	docker run -it --rm -e LOG_TAILING_INITIAL_LINES=$(LOG_TAILING_INITIAL_LINES) \
		-v $$(pwd)/history.log:/history.log simplewebhook

clean:
	docker image rm simplewebhook
	rm history.log

run-local: ## RUN - Run with default args
	cd webhook ; \
	go run .

clean-local:
	cd webhook ; \
	rm simple-webhook
	rm *.log

build-local: ## BUILD - Build application
	cd webhook ; \
	go mod download ; \
	go build

install-local: build-local ## INSTALL - Build and install application
	cd webhook ; \
	go install
