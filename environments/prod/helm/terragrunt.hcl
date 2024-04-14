terraform {
  source = "../../../modules/helm/"
}

include "root" {
  path   = find_in_parent_folders()
  expose = true
}

// dependency "eks" {
//   config_path                             = "../eks"
//   mock_outputs_allowed_terraform_commands = ["init", "validate", "plan", "providers", "terragrunt-info", "show"]
//   mock_outputs = {
//     cluster_endpoint                   = "fake-cluster_endpoint"
//     cluster_certificate_authority_data = "fake-cluster_certificate_authority_data"
//   }
// }

// inputs = {
//   cluster_name                           = include.root.locals.eks_cluster_name
//   cluster_endpoint                       = dependency.eks.outputs.cluster_endpoint
//   cluster_certificate_authority_data     = dependency.eks.outputs.cluster_certificate_authority_data
// }