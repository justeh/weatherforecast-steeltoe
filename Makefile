NAMESPACE:=justeh

.PHONY: source
source: deploy-source

.PHONY: publish
publish:
	docker push $(DOCKER_HUB_USERNAME)/weatherforecast-steeltoe

.PHONY: delete
delete:
	tanzu apps workload delete weatherforecast-steeltoe -n $(NAMESPACE) -y

.PHONY: get
get:
	tanzu apps workload get weatherforecast-steeltoe -n $(NAMESPACE)

.PHONY: deploy-source
deploy-source:
	tanzu apps workload delete weatherforecast-steeltoe -n $(NAMESPACE) -y
	tanzu apps workload apply -f config/workload.yaml -y -n $(NAMESPACE)