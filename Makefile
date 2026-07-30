# replace with your favorite package manager (npm/pnpm/yarn)
PM := npm
PM_RUN := $(PM) run

.PHONY: install start lint format typecheck

install:
	$(PM) install

start:
	$(PM_RUN) start

lint:
	$(PM_RUN) lint

format:
	$(PM_RUN) format

typecheck:
	$(PM_RUN) typecheck