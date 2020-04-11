CLUSTER_NAME := my-gke-cluster
ZONE := asia-northeast1

plan:
	terraform plan

app:
	terraform apply -auto-approve

setns:
	kubectl config set-context $(kubectl config current-context) --namespace=sock-shop

cred:
	gcloud container clusters get-credentials $(CLUSTER_NAME) --zone $(ZONE)
