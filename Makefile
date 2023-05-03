MAKEFLAGS += --warn-undefined-variables

SHELL := /usr/bin/env bash

# ================================================
# SHORTCUTS
# ================================================

default: help

.PHONY: help
help: # Show help for each of the Makefile recipes.
	@echo ""
	@grep -E '^[a-zA-Z0-9 -]+:.*#'  Makefile | sort | while read -r l; do printf "\033[1;32m$$(echo $$l | cut -f 1 -d':')\033[00m:$$(echo $$l | cut -f 2- -d'#')\n"; done
	@echo ""

.PHONY: hooks
hooks: # Setup pre-commit hooks
	pre-commit install
	pre-commit gc
	pre-commit autoupdate

.PHONY: hooks-run
hooks-run: # Run all pre-commit hooks
	pre-commit run --all-file

.PHONY: run-gitleaks
run-gitleaks: # Run secret-detection
	gitleaks detect -c .github/config/.gitleaks.toml --verbose  .
