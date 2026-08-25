# replace with your favorite package manager (npm/pnpm/yarn)
PM := npm
PM_RUN := $(PM) run

.PHONY: install start check fix typecheck

install:
	$(PM) install

start:
	$(PM_RUN) start

check:
	$(PM_RUN) check

fix:
	$(PM_RUN) fix

typecheck:
	$(PM_RUN) typecheck