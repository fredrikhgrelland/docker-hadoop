branch = $(shell git rev-parse --abbrev-ref HEAD)

.ONESHELL .PHONY: hadoop build push
.DEFAULT_GOAL := build

build: hadoop

custom_ca:
ifdef CUSTOM_CA
	cp -rf $(CUSTOM_CA)/* ca_certificates/ || cp -f $(CUSTOM_CA) ca_certificates/
endif

hadoop: custom_ca
	docker build . -t local/hadoop:$(branch)
	docker tag  local/hadoop:$(branch) local/hadoop:latest

