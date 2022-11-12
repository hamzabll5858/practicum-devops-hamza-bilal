terraform {
  source = "../../modules/gke"
}

include {
  path = find_in_parent_folders()
}

inputs = {

}