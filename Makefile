.PHONY: help install check-lint fix-lint pre-commit clean

help:  ## Show this help message
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

install:  ## Install dependencies and pre-commit hooks
	npm install -g markdownlint-cli
	pre-commit install

check-lint:  ## Check markdown files with markdownlint
	markdownlint .

fix-lint:  ## Fix markdown files with markdownlint
	markdownlint --fix .

pre-commit:  ## Run pre-commit hooks on all files
	pre-commit run --all-files

clean:  ## Clean up generated files
	find . -name ".DS_Store" -delete
