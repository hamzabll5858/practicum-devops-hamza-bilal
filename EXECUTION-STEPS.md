 terragrunt apply

gcloud auth login

gcloud auth configure-docker -y


terragrunt apply

gcloud components install gke-gcloud-auth-plugin

gcloud container clusters get-credentials kube-primary --zone us-central1-a --project root-project-5858

