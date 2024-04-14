locals {
  aws_region        = "us-east-1"
  deployment_prefix = "main-prod"
  source_version    = "v0.0.1"
  eks_cluster_name  = "${local.deployment_prefix}-eks-cluster"
  default_tags = {
    "TerminationDate"  = "Permanent",
    "Environment"      = "Production",
    "Team"             = "DevOps",
    "DeployedBy"       = "Terraform",
    "OwnerEmail"       = "daniilkondrashin210@gmail.com"
    "DeploymentPrefix" = local.deployment_prefix
  }
}
remote_state {
  backend = "s3"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
  config = {
    bucket         = "${local.deployment_prefix}-terraform-states-backend-${local.aws_region}-v1"
    key            = "${path_relative_to_include()}/terraform.tfstate"
    region         = local.aws_region
    encrypt        = true
    dynamodb_table = "${local.deployment_prefix}-terraform-states-backend-${local.aws_region}-v1"
  }
}

# Generate an AWS provider block
generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
provider "aws" {
  region = var.aws_region
  default_tags {
    tags = var.default_tags
  }
}

variable "aws_region" {
  description = "AWS Region."
}

variable "default_tags" {
  type        = map(string)
  description = "Default tags for AWS that will be attached to each resource."
}
EOF
}
inputs = {
  aws_region        = local.aws_region
  deployment_prefix = local.deployment_prefix
  default_tags      = local.default_tags
}