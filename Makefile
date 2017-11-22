SERVERLESS_VERSION = $(shell curl -L -s -H 'Accept: application/json' https://github.com/serverless/serverless/releases/latest|jq -r  .tag_name|sed 's/v//')
IMAGE_NAME ?= svls/serverless:$(SERVERLESS_VERSION)
TAG = $(SERVERLESS_VERSION)

all: release

release: build push tag

build:
	{ \
	version=${SERVERLESS_VERSION} j2 Dockerfile.j2 > Dockerfile ;\
	docker build -t $(IMAGE_NAME) . ;\
	}

pull:
	docker pull $(IMAGE_NAME)
push:
	docker push $(IMAGE_NAME)

shell:
	docker run --rm -it -v $(PWD):/opt/app -v ~/.aws:/root/.aws -v ~/.ssh:/root/.ssh $(IMAGE_NAME) bash

tag:
	{ \
	git tag $(TAG) ;\
	git push origin $(TAG) ;\
	}
