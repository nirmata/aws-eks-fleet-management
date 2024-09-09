 resource "aws_cloudwatch_dashboard" "cni-helper-cw-dashboard" {
  dashboard_name = "VPC-CNI"
  dashboard_body = replace( file("vpc-cni-dw-dashboard.json"),"**aws_region**", local.region )

}

locals{
    scrape_interval = "30s"
    scrape_timeout  = "10s"
}

data "aws_ssm_parameter" "amp_arn" {
  name = "${local.context_prefix}-${var.amazon_managed_prometheus_suffix}-arn"
}

resource "aws_prometheus_scraper" "fleet-scraper" {
  source {
    eks {
      cluster_arn = module.eks.cluster_arn
      subnet_ids  = module.vpc.private_subnets
      security_group_ids = [module.eks.node_security_group_id]
    }
  }
  destination {
    amp {
       workspace_arn = data.aws_ssm_parameter.amp_arn.value
    }
  }
  alias = "fleet-hub"
  scrape_configuration = replace(
    replace(
      replace(
        replace(
          replace(
            file("${path.module}/../common/scraper-config.yaml"),
            "{scrape_interval}",
            local.scrape_interval
          ),
          "{scrape_timeout}",
          local.scrape_timeout
        ),
        "{cluster}",
        local.name
      ),
      "{region}",
      local.region
    ),
    "{account_id}",
    data.aws_caller_identity.current.account_id
  )
 
}



# module "grafana_pod_identity" {
#   source = "terraform-aws-modules/eks-pod-identity/aws"
#   version = "~> 1.4.0"

#   name = "grafana-sa"

#   #amazon_managed_service_prometheus_workspace_arns = [aws_prometheus_workspace.amp.arn]
#   additional_policy_arns = {
#     "PrometheusQueryAccess ": "arn:aws:iam::aws:policy/AmazonPrometheusQueryAccess"
#   }


#   # Pod Identity Associations
#   association_defaults = {
#     namespace       = "grafana-operator"
#   }
#   associations = {
#     server = {
#       cluster_name = module.eks.cluster_name
#       service_account = "grafana-sa"
#     }
#   }

#   tags = local.tags
# }



