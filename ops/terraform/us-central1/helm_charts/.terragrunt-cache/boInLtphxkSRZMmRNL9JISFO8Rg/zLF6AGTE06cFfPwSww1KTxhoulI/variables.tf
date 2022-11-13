variable "project_id" {
  type        = string
  description = "Project ID"
  default     = "root-project-5858"
}

variable "cluster_id" {
  type        = string
  description = "GKE Cluster ID"
  default     = "root-project-5858"
}

variable "chart_name" {
  type        = string
  description = "Chart Name"
  default     = "ingress-controller"
}

variable "chart_namespace" {
  type        = string
  description = "Chart Namespace"
  default     = "ingress-controller"
}

variable "cluster_name" {
  type        = string
  description = "K8 Cluster Name"
  default     = "kube-primary"
}

variable "cluster_ca_cert" {
  type        = string
  description = "Cluster CA certs ID"
  default     = ""
}

variable "cluster_endpoint" {
  type        = string
  description = "Cluster endpoint"
  default     = ""
}

