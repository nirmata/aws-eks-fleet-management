variable "project_context_prefix" {
  description = "Prefix for project"
  type        = string
  default     = "eks-fleet-gitops"
}

variable "secret_name_ssh_secrets" {
  description = "Secret name for SSH secrets"
  type        = string
  default     = "git-ssh-secrets-fleet-workshop"
}


variable "gitops_fleet_repo_name" {
  description = "Git repository name for fleet"
  default     = "aws-eks-fleet-management"
}
variable "gitops_fleet_basepath" {
  description = "Git repository base path for fleet"
  default     = "gitops/fleet/"
}
variable "gitops_fleet_path" {
  description = "Git repository path for fleet"
  default     = "bootstrap"
}
variable "gitops_fleet_revision" {
  description = "Git repository revision/branch/ref for fleet"
  default     = "feature/nirmata-addon"
}

variable "gitops_addons_repo_name" {
  description = "Git repository name for addons"
  default     = "aws-eks-fleet-management"
}
variable "gitops_addons_basepath" {
  description = "Git repository base path for addons"
  default     = "gitops/addons/"
}
variable "gitops_addons_path" {
  description = "Git repository path for addons"
  default     = "addons"
}
variable "gitops_addons_revision" {
  description = "Git repository revision/branch/ref for addons"
  default     = "feature/nirmata-addon"
}

variable "gitops_platform_repo_name" {
  description = "Git repository name for platform"
  default     = "aws-eks-fleet-management"
}
variable "gitops_platform_basepath" {
  description = "Git repository base path for platform"
  default     = "gitops/platform/"
}
variable "gitops_platform_path" {
  description = "Git repository path for workload"
  default     = "bootstrap"
}
variable "gitops_platform_revision" {
  description = "Git repository revision/branch/ref for workload"
  default     = "feature/nirmata-addon"
}


variable "gitops_workload_repo_name" {
  description = "Git repository name for workload"
  default     = "aws-eks-fleet-management"
}
variable "gitops_workload_basepath" {
  description = "Git repository base path for workload"
  default     = "gitops/apps"
}
variable "gitops_workload_path" {
  description = "Git repository path for workload"
  default     = ""
}
variable "gitops_workload_revision" {
  description = "Git repository revision/branch/ref for workload"
  default     = "feature/nirmata-addon"
}

variable "ssm_parameter_name_argocd_role_suffix" {
  description = "SSM parameter name for ArgoCD role"
  type        = string
  default     = "argocd-central-role"
}
variable "amazon_managed_prometheus_suffix" {
  description = "SSM parameter name for Amazon Manged Prometheus"
  type        = string
  default     = "amp-hub"
}
variable "backend_team_view_role_suffix" {
  description = "SSM parameter name for Fleet Workshop Team Backend IAM Role"
  type        = string
  default     = "backend-team-view-role"
}
variable "frontend_team_view_role_suffix" {
  description = "SSM parameter name for Fleet Workshop Team Backend IAM Role"
  type        = string
  default     = "frontend-team-view-role"
}

variable "gitea_user" {
  description = "User to login on the Gitea instance"
  type = string
  default = "nirmata"
}
variable "gitea_password" {
  description = "Password to login on the Gitea instance"
  type = string
  sensitive = true
  default = ""
}
variable "gitea_external_url" {
  description = "External url to access gitea"
  type = string
  default = ""
}

variable "gitea_repo_prefix" {
  description = "Repo prefix"
  type = string
  default = "workshop-user/"
}

variable "nirmata_api_token" {
  description = "NCH API Token"
  type = string
  default = ""
}

variable "create_github_repos" {
  description = "Create Github repos"
  type = bool
  default = false
}

variable "exclude_alerts" {
  description = "exclude alerts for prometheus"
  type = bool
  default = true
}

variable "exclude_prometheus" {
  description = "Exclude managed prometheus configurations"
  type = bool
  default = true
}

variable "exclude_recording_rules" {
  description = "Exclude recording rules"
  type = bool
  default = true
}

variable "exclude_security_hub" {
  description = "Exclude AWS security hub"
  type = bool
  default = true
}