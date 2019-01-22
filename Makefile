.PHONY: install test

default:
	@echo "Usage: make <command>"
	@echo "Valid commands:"
	@echo " * install" 
	@echo " * test" 

install:
	@dot/install.sh

test: install
	@echo "Test passed"

