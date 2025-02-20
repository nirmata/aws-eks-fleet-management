variable "vpc_cidr" {
  description = "VPC CIDR"
  type        = string
}

variable "kubernetes_version" {
  description = "Kubernetes version"
  type        = string
  default     = "1.31"
}

variable "addons" {
  description = "EKS addons"
  type        = any
  default = {
    enable_aws_load_balancer_controller = true
    enable_metrics_server               = true
    enable_karpenter                    = false
    enable_cw_prometheus                = false
    enable_kyverno                      = true
    enable_kyverno_policy_reporter      = false
    enable_kyverno_policies             = true
    enable_nirmata_cluster_registrator  = true
  }
}

variable "secret_name_nirmata_api_token" {
  description = "Secret name for Nirmata API token"
  type        = string
  default     = "eks-fleet-gitops-nirmata-api-token"
}

variable "kms_key_admin_roles" {
  description = "list of role ARNs to add to the KMS policy"
  type        = list(string)
  default     = []

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

variable "enable_prometheus_scraper" {
  description = "Enable Prometheus Scraper"
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
