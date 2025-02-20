terraform {
  required_version = ">= 1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.66.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = ">= 2.10.1"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.22.0"
    }
  }

  # ##  Used for end-to-end testing on project; update to suit your needs
  backend "s3" {
    # bucket = "terraform-ssp-github-actions-state"
    # region = "us-west-2"
    # key    = "e2e/ipv4-prefix-delegation/terraform.tfstate"
    bucket = "eks-fleet-gitops-state-2"
    region = "us-west-2"
    key    = "eks-fleet-gitops/hub/terraform.tfstate"
    profile = "mgmt_account"
  }
}
