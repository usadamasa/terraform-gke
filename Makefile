CLUSTER_NAME := my-gke-cluster
ZONE := aisa-northeast1-a

cred:
	gcloud container clusters get-credentials $(CLUSTER_NAME) --zone $(ZONE)
