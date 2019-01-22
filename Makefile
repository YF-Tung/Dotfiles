.PHONY: install test

default:
	@echo "Usage: make <command>"
	@echo "Valid commands:"
	@echo " * install" 
	@echo " * test" 

install:
	@dot/install.sh

test:
	@dot/install.sh --noninteractive
	@echo "Test passed"

