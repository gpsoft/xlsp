IMAGE_NAME := php7clii
CONT_NAME := php7cli
USER ?= $(USERNAME)

all:
	@echo Usage:
	@echo make image
	@echo make dev
	@echo make attach

# Build a docker image.
image:
	docker build --tag=$(IMAGE_NAME) .

# Start development
.PHONY: dev attach
dev:
	docker run --rm -it \
		--env HOST_USER=$(USER) \
		--env HOST_UID=`id -u` \
		--env HOST_GROUP=docker \
		--env HOST_GID=`getent group docker |cut -d : -f 3` \
		--volume $(shell pwd):/home/$(USER)/proj \
		--hostname $(CONT_NAME) \
		--name $(CONT_NAME) \
		--workdir /home/$(USER)/proj \
		$(IMAGE_NAME) /root/dev.sh

# Attach to the running container.
attach:
	docker exec -it \
		--user $(USER) \
		$(CONTAINERNAME) /bin/sh

.SILENT:
%:
	@:
