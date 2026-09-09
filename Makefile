# replace with your favorite package manager (npm/pnpm/yarn)
PM := npm
PM_RUN := $(PM) run

.DEFAULT_GOAL := help

.PHONY: help setup start check fix typecheck

help:
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make <target>\n"} \
		/^[a-zA-Z0-9_-]+:.*##/ { printf "  %-22s %s\n", $$1, $$2 } \
		/^# ──/ { printf "\n%s\n", $$0 }' $(MAKEFILE_LIST)

# ── App ──────────────────────────────────────────────────────────────────────

setup: ## Install deps and create .env
	$(PM) install
	test -f .env || cp .env.example .env

start: ## Start the dev server
	$(PM_RUN) start

check: ## Lint
	$(PM_RUN) check

fix: ## Auto-fix lint
	$(PM_RUN) fix

typecheck: ## Typecheck
	$(PM_RUN) typecheck
