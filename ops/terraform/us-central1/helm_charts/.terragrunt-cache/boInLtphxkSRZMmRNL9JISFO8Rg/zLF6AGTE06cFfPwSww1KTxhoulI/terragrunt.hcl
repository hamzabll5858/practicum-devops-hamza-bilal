terraform {
  source = "../../modules/helm"
}

include {
  path = find_in_parent_folders()
}

dependency "cluster" {
  config_path = "../gke"
}

inputs = {
  project_id       = "root-project-5858"
  cluster_id       = dependency.cluster.outputs.cluster_id
  cluster_ca_cert  = dependency.cluster.outputs.cluster_ca_cert
  cluster_endpoint = dependency.cluster.outputs.cluster_endpoint
  chart_name       = "ingress-controller"
  chart_namespace  = "ingress-controller"
  cluster_name     = "kube-primary"

}