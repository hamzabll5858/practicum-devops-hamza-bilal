BIN="bin"
SERVICE_NAME='assessment-api'
GCP_PROJECT_NAME='assessment-api'

ifeq (, $(shell which go))
$(warning "could not find go in $(PATH), Install golang")
endif

.PHONY: all build-image

default: all

all: build

build-image:
	docker build -t $(SERVICE_NAME):latest .
	docker tag $(SERVICE_NAME):latest gcr.io/$(GCP_PROJECT_NAME)/busybox:latest
	docker push gcr.io/my-project/busybox
	echo 'Stage build Successfull!'

deploy-istio:
    istioctl install --set profile=default -y
    echo 'Stage deploy-istio Successfull!'

deploy-monitoring:
	kubectl create ns monitoring || sleep 1
	helm upgrade --install monitoring -n monitoring ./ops/helm/kube-prometheus-stack
	echo 'Stage deploy-monitoring Successfull!'

delete-monitoring:
	helm delete monitoring -n monitoring
	kubectl delete ns monitoring

clean:
