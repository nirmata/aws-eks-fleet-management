variable "vpc_cidr" {
  description = "VPC CIDR"
  type        = string
  default     = "10.60.0.0/16"
}

variable "kubernetes_version" {
  description = "Kubernetes version"
  type        = string
  default     = "1.31"
}

variable "kms_key_admin_roles" {
  description = "list of role ARNs to add to the KMS policy"
  type        = list(string)
  default     = []
}

variable "addons" {
  description = "Kubernetes addons"
  type        = any
  default = {
    enable_aws_load_balancer_controller = true
    enable_aws_ebs_csi_resources        = true # generate gp2 and gp3 storage classes for ebs-csi
    enable_metrics_server               = true
    enable_external_secrets             = true
    enable_argocd                       = true
    enable_kyverno                      = false
    enable_nirmata_kyverno              = true
    enable_kyverno_policy_reporter      = false
    enable_kyverno_policies             = true
    enable_nirmata_cluster-regestrator  = true
    enable_karpenter                    = false
    enable_cw_prometheus                = false
  }
}

variable "secret_name_nirmata_api_token" {
  description = "Secret name for Nirmata API token"
  type        = string
  default     = "eks-fleet-gitops-nirmata-api-token"
}

variable "secret_name_git_data_addons" {
  description = "Secret name for Git data addons"
  type        = string
  default     = "eks-fleet-gitops-addons"
}

variable "secret_name_git_data_fleet" {
  description = "Secret name for Git data fleet"
  type        = string
  default     = "eks-fleet-gitops-fleet"
}

variable "secret_name_git_data_platform" {
  description = "Secret name for Git data platform"
  type        = string
  default     = "eks-fleet-gitops-platform"
}

variable "secret_name_git_data_workloads" {
  description = "Secret name for Git data workloads"
  type        = string
  default     = "eks-fleet-gitops-workloads"
}

variable "project_context_prefix" {
  description = "Prefix for project"
  type        = string
  default     = "eks-fleet-gitops"
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

variable "enable_prometheus_scraper" {
  description = "Enable Prometheus scraper"
  type        = bool
  default     = false
}

variable "enable_cloudwatch_dashboards" {
  description = "Enable CloudWatch Dashboards"
  type        = bool
  default     = false
}

variable "enable_notifications" {
  description = "Enable SNS Notifications"
  type        = bool
  default     = false
}

variable "enable_adot" {
  description = "Enable adot collector"
  type        = bool
  default     = false
}

variable "enable_prometheus" {
  description = "Enable aws managed prometheus"
  type        = bool
  default     = false
}
