SERVICE_NAME='assessment-learning'
GCP_PROJECT_NAME='root-project-5858'

# HELP
.PHONY: help

help:
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

# DOCKER TASKS

build-push-gcr-image:
	docker build -t $(SERVICE_NAME):latest .
	docker tag $(SERVICE_NAME):latest gcr.io/$(GCP_PROJECT_NAME)/$(SERVICE_NAME):latest
	docker push gcr.io/$(GCP_PROJECT_NAME)/$(SERVICE_NAME)
	echo 'Stage build Successful!'

deploy-service:
	kubectl create ns $(SERVICE_NAME) || sleep 1
	helm upgrade --install $(SERVICE_NAME) -n $(SERVICE_NAME) ./ops/helm/$(SERVICE_NAME)
	echo 'Stage deploy-service Successfull!'

delete-service:
	helm delete monitoring -n monitoring
	kubectl delete ns monitoring