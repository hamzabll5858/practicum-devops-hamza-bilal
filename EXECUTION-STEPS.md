 terragrunt apply

gcloud auth login

gcloud auth configure-docker -y


terragrunt apply

gcloud components install gke-gcloud-auth-plugin

gcloud container clusters get-credentials kube-primary --zone us-central1-a --project root-project-5858



gcloud iam service-accounts keys create <output_filename> --iam-account=<account_email>


kubectl create secret docker-registry gcr-pull-secret \
--namespace my-custom-app \
--docker-server=https://gcr.io \
--docker-username=_json_key \
--docker-password="$(cat service_account_key.json)" \
--docker-email='<service_account_email>'




Implement service mesh
Implement health endpoints
Multi zonal GKE cluster master

Since bundle.js is calling api fron internet  the API should expose to internet as well

export NGINX_INGRESS_IP=$(kubectl get service nginx-ingress-ingress-nginx-controller -ojson | jq -r '.status.loadBalancer.ingress[].ip')
