terraform {
  required_version = ">= 1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.67.0"
    }
    github = {
      source  = "integrations/github"
      version = "~> 6.0"
    }
  }

  # ##  Used for end-to-end testing on project; update to suit your needs
  backend "s3" {
    bucket = "eks-fleet-gitops-state-2"
    region = "us-west-2"
    key    = "eks-fleet-gitops/common"
    profile = "mgmt_account"
  }
}
