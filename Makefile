CLUSTER_NAME := my-gke-cluster
ZONE := asia-northeast1

cred:
	gcloud container clusters get-credentials $(CLUSTER_NAME) --zone $(ZONE)
