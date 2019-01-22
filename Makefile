.PHONY: install test

default:
	@echo "Usage: make <command>"
	@echo "Valid commands:"
	@echo " * install" 
	@echo " * test" 

install:
	@dot/install.sh
	@echo "Done. Please 'source ~/.bashrc' to update this session"

test: install
	@echo "Test passed"

