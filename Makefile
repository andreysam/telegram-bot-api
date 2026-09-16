image_name := andreysam/telegram-bot-api
image_tag := $(shell date +%Y%m%d)

.PHONY: build
build:
	docker build -t $(image_name):$(image_tag) --build-arg nproc=$(shell nproc) .
	docker tag $(image_name):$(image_tag) $(image_name):latest

.PHONY: publish
publish:
	docker push $(image_name):$(image_tag)
	docker push $(image_name):latest
