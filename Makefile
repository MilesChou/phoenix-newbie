#!/usr/bin/make -f
IMAGE := $(shell basename $(shell pwd))
VERSION := latest

.PHONY: all build rebuild shell run

# ------------------------------------------------------------------------------

all: build

build:
	docker build -t=$(IMAGE):$(VERSION) .

rebuild:
	docker build -t=$(IMAGE):$(VERSION) --no-cache .

shell:
	docker run --rm -it $(IMAGE):$(VERSION) sh

run:
	docker run --rm -it -p 4000:4000 $(IMAGE):$(VERSION)