.PHONY: install test

default:
	@echo "Usage: make <command>"
	@echo "Valid commands:"
	@echo " * install" 
	@echo " * test" 

install:
	bash tar.sh
	bash dot.sh build/dot.tar

test: install
	@echo "Test passed"

