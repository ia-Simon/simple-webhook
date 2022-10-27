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

run: ## Build and run simplewebhook container
	echo "Building simplewebhook..." && docker image build -t simplewebhook webhook
	touch history.log
	echo '';
	$(call input,< Webhook subdomain (https://<subdomain>.loca.lt): ,SUBDOMAIN) && \
	echo '' && \
	docker run -it --rm -e WEBHOOK_SUBDOMAIN=$$SUBDOMAIN -e LOG_TAILING_INITIAL_LINES=$(LOG_TAILING_INITIAL_LINES) \
		-v $$(pwd)/history.log:/history.log simplewebhook
