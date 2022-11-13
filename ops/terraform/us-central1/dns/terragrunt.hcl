terraform {
  source = "../../modules/dns"
}

include {
  path = find_in_parent_folders()
}

dependency "helm_chart" {
  config_path = "../helm_charts"
}


inputs = {
  project_id       = "root-project-5858"
  ingress_ip       =  dependency.helm_chart.outputs.ingress_ip
}